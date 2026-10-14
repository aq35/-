# Git 実践ガイド — Rust バックエンド × GraphQL スキーマ（サブモジュール）

Git を学びながら、そのまま現場で使える運用ルールとコマンドをまとめたリポジトリです。

想定している構成:

```
backend/                 ← このリポジトリ（Rust）
├── schema/              ← サブモジュール（GraphQL スキーマ専用リポジトリ）
│   └── schema.graphql
├── build.rs             ← schema/ からコードを生成
└── src/
```

## 目次

> 毎日の作業で使うなら、まず **[6. 普段の作業コマンド集](docs/06-daily-commands.md)** から。

| # | ドキュメント | 内容 |
|---|---|---|
| 1 | [コマンド一覧（英語訳・日本語訳）](docs/01-commands.md) | よく使うコマンドを英単語の意味つきで |
| 2 | [ブランチ戦略（トランクベース ＋ hotfix の cherry-pick）](docs/02-branch-strategy.md) | 開発 → 本番の流れと緊急修正 |
| 3 | [サブモジュールとコード生成](docs/03-submodule-codegen.md) | スキーマ更新から生成までの手順 |
| 4 | [チートシート](docs/04-cheatsheet.md) | 1 ページで全体を見返す用 |
| 5 | [AWS パイプライン（CodePipeline V2）](docs/05-aws-pipeline.md) | AWS のベストプラクティスに沿ったデプロイ設計 |
| 6 | [普段の作業コマンド集](docs/06-daily-commands.md) | やりたいこと別のコマンド（英語・読み方・日本語、確認コマンド、原理つき） |
| 7 | [エンジニアの仕事で使う言葉](docs/07-engineering-terms.md) | Slack・レビュー・障害対応・設計の用語 106 語（英語・読み方・日本語・使う場面） |
| 8 | [AI への指示文テンプレート](docs/08-ai-prompts.md) | 指示の 5 要素、場面別の指示文（調査・実装・バグ修正・レビュー・スキーマ更新・衝突対応など）、確認コマンド |

設定ファイルのサンプル:

| ファイル | 用途 |
|---|---|
| [examples/gitconfig](examples/gitconfig) | 推奨 Git 設定とエイリアス |
| [examples/justfile](examples/justfile) | よく使う操作を 1 コマンドにまとめたタスク定義 |
| [examples/build.rs](examples/build.rs) | サブモジュールのスキーマからコード生成する雛形 |
| [examples/infra/pipeline.yml](examples/infra/pipeline.yml) | CodePipeline V2 ＋ CodeBuild の定義（CloudFormation） |
| [examples/buildspec/](examples/buildspec/) | ビルド・デプロイ・タグ付け・PR 検証の buildspec |
| [examples/scripts/](examples/scripts/) | hotfix 検査・スキーマ固定検査・デプロイの各スクリプト |
| [examples/CODEOWNERS](examples/CODEOWNERS) | パイプライン関連ファイルの変更に担当チームの承認を必須化 |
| [examples/dependabot.yml](examples/dependabot.yml) | schema サブモジュールの更新 PR を自動作成 |

## 覚えるのは 4 つのルールだけ

1. **すべての変更はまず `main` へ**（Upstream First）
2. **ビルドは 1 回、同じ成果物を dev → staging → prod へ昇格させる**
3. **本番に出たらパイプラインがタグ `prod-*` を打つ**（人はタグを打たない）
4. **本番の不具合はまずロールバック。** 緊急修正が必要なら本番タグから `hotfix/*` を切り、`cherry-pick -x` で運ぶ

スキーマ更新は「サブモジュール更新 ＋ 生成コードの追従」を 1 コミットにまとめます。

```
main ──●──●──●──●──▶   マージごとに CodePipeline が起動
              │
              └─▶ Build（1 回）→ dev → staging → 承認 → prod → タグ prod-20261013-101500

緊急時: prod-20261013-101500 ──● hotfix/prod-20261013-101500（main の修正を cherry-pick -x）
```

## 最短スタート

```bash
# 1. 推奨設定を読み込む（一度だけ）
git config --global include.path "$(pwd)/examples/gitconfig"

# 2. サブモジュールごと取得
git clone --recurse-submodules <backend-repo-url>

# 3. 作業ブランチを切って開発
git switch -c feat/user-search
# ...編集...
git add -p && git commit
git push        # → PR を作って main へ squash merge
```
