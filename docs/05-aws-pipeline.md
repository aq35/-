# 5. AWS パイプライン（CodePipeline V2）

AWS のベストプラクティスに合わせたデプロイパイプラインの設計です。ブランチの使い方は [2. ブランチ戦略](02-branch-strategy.md) を参照してください。

主な拠り所:

- [Deployment Pipeline Reference Architecture（DPRA）](https://pipelines.devops.aws.dev/)
- [Amazon Builders' Library: Automating safe, hands-off deployments](https://aws.amazon.com/builders-library/automating-safe-hands-off-deployments/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)（運用上の優秀性・セキュリティの柱）

## 5-1. 採用したベストプラクティス

| ベストプラクティス | このガイドでの実現方法 |
|---|---|
| トランクベース開発 | 常設ブランチは `main` だけ。短命ブランチから squash merge |
| Build once, deploy many | Build ステージでイメージを 1 回だけ作り、**ダイジェスト指定**で全環境へ |
| 成果物を変更不可にする | ECR のタグを `IMMUTABLE` に、タグは `git-<コミットSHA>` |
| 段階的なデプロイ | dev → staging → 承認 → prod |
| 自動ロールバック | V2 のステージ失敗時ロールバック（`OnFailure: ROLLBACK`） |
| 環境ごとにアカウントを分ける | ツール / dev / staging / prod の 4 アカウント |
| 最小権限 | ビルドとデプロイは別ロール。環境へは AssumeRole。GitHub トークンも用途別 |
| パイプラインもコードで管理 | [examples/infra/pipeline.yml](../examples/infra/pipeline.yml)（CloudFormation） |
| 成果物の暗号化 | S3 と CodeBuild を KMS のカスタマーマネージドキーで暗号化、TLS 以外を拒否 |
| セキュリティの自動検査 | ECR の push 時スキャン、`cargo clippy -D warnings` |
| PR 時点で品質ゲート | CodeBuild の PR 検証を main のマージ条件にする |

## 5-2. アカウント構成

```
┌──────────────── ツール用アカウント ────────────────┐
│ CodePipeline / CodeBuild / ECR / S3(成果物) / KMS    │
└───────┬───────────────┬───────────────┬────────────┘
        │ AssumeRole    │ AssumeRole    │ AssumeRole
        ▼               ▼               ▼
   dev アカウント   staging アカウント   prod アカウント
   backend-deploy   backend-deploy       backend-deploy   ← 各アカウントに同名のロールを用意
   (ECR から pull)  (ECR から pull)      (ECR から pull)
```

各環境アカウントの `backend-deploy` ロールの信頼ポリシー（例）:

```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::<ツール用アカウントID>:root" },
    "Action": "sts:AssumeRole",
    "Condition": { "ArnLike": { "aws:PrincipalArn": "arn:aws:iam::<ツール用アカウントID>:role/*CodeBuildRole*" } }
  }]
}
```

権限ポリシーは、デプロイ方式（ECS / Lambda / CDK）に必要な操作だけに絞ります。

## 5-3. パイプラインの構成

```
Source ──▶ Build ──▶ Dev ──▶ Staging ──▶ Approval ──▶ Prod
 │          │         │        │           │           ├ Deploy
 │          │         │        │           │           └ Tag（prod-* を Git に記録）
 │          │         └────────┴───────────┴── 失敗時は直前の成功版へ自動ロールバック
 │          └ fmt / clippy / test / schema 固定チェック / hotfix チェック → イメージ push
 └ GitHub（CodeConnections）。.git ごと取得（完全クローン）
```

| 項目 | 設定 | 理由 |
|---|---|---|
| パイプラインの種類 | **V2** | ブランチの glob（`hotfix/*`）トリガー、ステージのロールバックに必要 |
| 実行モード | `SUPERSEDED` | 後から来た新しいコミットが、待機中の古い実行を追い越す（main の最新を優先） |
| ソース出力 | `CODEBUILD_CLONE_REF`（完全クローン） | サブモジュールの取得、hotfix の検査、タグ付けに `.git` が必要 |
| トリガー | 通常: `main` / 緊急: `hotfix/*` | 同じテンプレートから 2 本のパイプラインを作る |

同じテンプレートから 2 スタックを作ります。

```bash
# 通常のパイプライン
aws cloudformation deploy --stack-name backend-pipeline \
  --template-file examples/infra/pipeline.yml --capabilities CAPABILITY_IAM \
  --parameter-overrides PipelineName=backend TriggerBranches=main \
    ConnectionArn=... FullRepositoryId=your-org/backend \
    DevAccountId=... StagingAccountId=... ProdAccountId=... \
    GitHubReadTokenSecretArn=... GitHubTagTokenSecretArn=...

# 緊急修正用のパイプライン（ECR と PR 検証は通常側のものを共有）
aws cloudformation deploy --stack-name backend-hotfix-pipeline \
  --template-file examples/infra/pipeline.yml --capabilities CAPABILITY_IAM \
  --parameter-overrides PipelineName=backend-hotfix 'TriggerBranches=hotfix/*' \
    CreateSharedResources=false ...（他は同じ）
```

## 5-4. リポジトリ内のファイル配置

backend リポジトリに次のように置きます（`examples/` 以下と同じ構成です）。

```
backend/
├── buildspec/
│   ├── build.yml          検査・テスト・イメージ作成（1 回だけ）
│   └── deploy.yml         環境アカウントのロールを引き受けてデプロイ
│                          ※ タグ付けと PR 検証の buildspec は、改変防止のため infra/pipeline.yml 側に固定
├── scripts/
│   ├── check-hotfix.sh    hotfix が main からの cherry-pick -x だけか検査
│   ├── check-schema-pin.sh schema が schema リポジトリの main にあるか検査
│   └── deploy.sh          デプロイ処理（ECS / Lambda / CDK に合わせて実装）
├── infra/
│   └── pipeline.yml       パイプライン定義
├── .github/
│   ├── CODEOWNERS         パイプライン関連ファイルの変更に担当チームの承認を必須化
│   └── dependabot.yml     schema サブモジュールの更新 PR を自動作成
├── schema/                サブモジュール
└── build.rs
```

## 5-5. サブモジュールを CodeBuild で取得する

CodePipeline の既定のソース出力（zip）には `.git` もサブモジュールも入りません。このガイドでは次の 2 つで対応しています。

1. ソースアクションを**完全クローン**（`OutputArtifactFormat: CODEBUILD_CLONE_REF`）にする
2. buildspec で、Secrets Manager の読み取り専用トークンを使ってサブモジュールを取得する

```yaml
- git config --global url."https://x-access-token:${GITHUB_READ_TOKEN}@github.com/".insteadOf "https://github.com/"
- git submodule update --init --recursive
```

- `.gitmodules` の URL は **HTTPS 形式**にしておく（[3. サブモジュールとコード生成](03-submodule-codegen.md)）
- トークンは GitHub の fine-grained personal access token（または GitHub App のトークン）で、**backend と schema の Contents: Read-only だけ**を付ける
- タグを打つためのトークンは別に用意し、**backend の Contents: Read and write だけ**を付ける

## 5-6. GitHub トークンの用途分け

| Secrets Manager のシークレット | 権限 | 使う場所 |
|---|---|---|
| `GitHubReadToken` | backend・schema の読み取り | Build、PR 検証 |
| `GitHubTagToken` | backend の書き込み | Prod ステージの Tag アクションのみ |

ソースの取得そのものは CodeConnections（GitHub App）が行うので、トークンを使うのはサブモジュールの取得とタグの push だけです。

## 5-7. 秘密情報を守る（リポジトリのコードを信用しすぎない）

buildspec や `build.rs` はリポジトリの中にあり、PR で誰でも書き換えられます。**リポジトリのコードが動く場所に秘密情報を置かない**のが原則です。

| 対策 | 内容 |
|---|---|
| **権限が要る buildspec はパイプライン定義に固定** | タグ付け（書き込みトークン）と PR 検証（未レビューのコードが動く）の buildspec は、リポジトリではなく `infra/pipeline.yml` に書いています。PR で中身を変えられません |
| **トークンは使い終わったらすぐ消す** | サブモジュールを取得したら、`cargo build`（= `build.rs` の実行）より前に `unset` し、git の設定からも削除します |
| **CODEOWNERS** | `buildspec/` `scripts/` `infra/` `.github/` を変える PR は、担当チームの承認を必須にします（[examples/CODEOWNERS](../examples/CODEOWNERS)） |
| **hotfix の検査は main 側のスクリプトで** | hotfix ブランチ側の `check-hotfix.sh` は改ざんできるため、`git show origin/main:scripts/check-hotfix.sh` を実行します |
| **短命のトークンに移行する** | 個人用トークン（PAT）は有効期限を短く設定してローテーションします。可能になったら GitHub App のインストールトークン（1 時間で失効）に置き換えます |

> 通常パイプラインの Build は、レビュー済みの main（または検査済みの hotfix）のコードだけを動かすので、buildspec をリポジトリに置いています。それでもトークンは、リポジトリのコードを動かす前に消しています。

## 5-8. 障害対応（ランブック）

| 状況 | 操作 | コマンド |
|---|---|---|
| デプロイ自体が失敗した | 自動でロールバックされる（`OnFailure: ROLLBACK`） | — |
| デプロイは成功したが本番で不具合 | **まず前の成功版へ戻す**（Prod への進行も自動で停止） | `just prod-rollback` |
| 修正を本番に出せる状態になった | Prod への進行を再開 | `just prod-unfreeze` |
| hotfix で出す | 通常パイプラインを止めてから hotfix を push | `just prod-freeze` → `git push` |

使っている AWS CLI のコマンド:

```bash
# Prod への進行を止める / 再開する
aws codepipeline disable-stage-transition --pipeline-name backend --stage-name Prod --transition-type Inbound --reason "..."
aws codepipeline enable-stage-transition  --pipeline-name backend --stage-name Prod --transition-type Inbound

# Prod ステージを、指定した過去の実行の版に戻す
aws codepipeline rollback-stage --pipeline-name backend --stage-name Prod --target-pipeline-execution-id <実行ID>
```

これらを実行できる IAM 権限は、リリース担当と当番に限定します。

## 5-9. さらに安全にするなら

規模や重要度に応じて追加します。

| 追加するもの | 内容 |
|---|---|
| ベイクタイムとアラーム監視 | prod デプロイ後に一定時間アラームを監視し、異常なら自動ロールバック（ECS のデプロイサーキットブレーカー ＋ CloudWatch アラーム、CodeDeploy の Blue/Green など） |
| 段階的な本番展開 | リージョンやセルごとに順番に出す（ウェーブ） |
| 統合テスト・E2E | Staging ステージに `RunOrder: 2` のテストアクションを追加 |
| 依存ライブラリの脆弱性検査 | Build に `cargo audit` / `cargo deny` を追加 |
| サプライチェーン | コミット署名の必須化、イメージ署名（AWS Signer など）とデプロイ時の検証、SBOM の生成、GitHub の秘密情報スキャン（push 時にブロック） |
| マージキュー | 人数が増えて main が壊れやすくなったら、GitHub の Merge queue を有効にする |
| 承認の自動化 | テストとアラームが十分に信頼できるようになったら、手動承認を外して完全自動化 |
| デプロイ時間帯の制限 | V2 のステージ条件で、本番デプロイを平日の日中に限定する |

## 5-10. 導入前に確認すること

このテンプレートは cfn-lint で構文を検証済みですが、実際の AWS 環境ではまだデプロイしていません。導入前に次を確認してください。

- `hotfix/*` のトリガーで起動したとき、`#{SourceVariables.BranchName}` が hotfix ブランチ名になること（`check-hotfix.sh` がこれを使う）
- 完全クローンの出力で、`git fetch` やサブモジュールの取得がトークン経由で通ること
- `scripts/deploy.sh` を実際のデプロイ方式で実装すること（今は雛形）
- `just prod-rollback` / `prod-freeze` / `prod-unfreeze` が、実際のパイプラインで意図どおり動くこと（AWS CLI のコマンドは未実行）
