# 2. ブランチ戦略（トランクベース ＋ チェリーピックによる緊急修正）

AWS が推奨する継続的デリバリーの形（[Deployment Pipeline Reference Architecture](https://pipelines.devops.aws.dev/)、[Amazon Builders' Library](https://aws.amazon.com/builders-library/)）に合わせています。パイプライン側の設計は [5. AWS パイプライン](05-aws-pipeline.md) を参照してください。

## 2-1. 全体像

```
          feat/*  fix/*      （短命: 数時間〜数日。PR + squash merge）
            │       │
            ▼       ▼
main ──●──●──●──●──●──●──▶   1 コミット = 1 回のビルド
                     │
                     └─▶ [Build] → [dev] → [staging] → [承認] → [prod] → タグ prod-YYYYMMDD-HHMMSS
                            同じイメージを昇格させる（Build once, deploy many）

緊急時のみ:
prod-20261013-101500 ●──●  hotfix/prod-20261013-101500
                        └ main の修正を cherry-pick -x → 同じ段階を通って prod へ
```

| ブランチ / タグ | 役割 | 誰が更新するか |
|---|---|---|
| `main` | 唯一の本流。マージ = 本番へ向かうリリース候補 | PR の squash merge のみ |
| `feat/*` `fix/*` `chore/*` | 作業用。main から切って main へ戻す | 各開発者 |
| タグ `prod-*` | 本番に出たコミットの記録 | **パイプラインが自動で打つ** |
| `hotfix/<本番タグ>` | 緊急修正の運搬用。本番タグから切る | `cherry-pick -x` のみ（CI で強制） |

### 覚えるルールは 4 つ

1. **すべての変更はまず `main` へ**（Upstream First）
2. **ビルドは 1 回、同じ成果物を dev → staging → prod へ昇格させる**
3. **本番に出たらパイプラインがタグを打つ**（人はタグを打たない）
4. **緊急修正は本番タグから `hotfix/*` を切り、`cherry-pick -x` で運ぶ**

### 前の版（release ブランチ ＋ 手動タグ）から変えた理由

| 観点 | 前の版 | 今の版（AWS 推奨） |
|---|---|---|
| ビルド | 環境ごとにビルド | **1 回だけ**。staging で確認したイメージがそのまま本番へ |
| 本番の起動 | 人がタグを push | **承認ボタン**。タグはデプロイ結果の記録 |
| 常設ブランチ | main ＋ release/X.Y | **main だけ** |
| cherry-pick | 毎回のリリースで使う | **緊急時だけ**使う |
| 未完成の機能 | release に入れないことで隔離 | **機能フラグ**で隠して main に入れる |

---

## 2-2. 日々の開発（main へ）

```bash
git switch main && git pull                  # 最新化
git switch -c feat/user-search               # 作業ブランチ作成（just start feat/user-search）

# ...編集...
git add -p
git commit -m "feat: ユーザー検索 API を追加"

git push                                     # 初回（push.autoSetupRemote で -u 不要）

# PR 中に main が進んだら追従（必要なとき）
git fetch && git rebase origin/main
git push --force-with-lease --force-if-includes   # rebase 後は履歴が変わるので通常の push は拒否される（git pushf）
# → PR 作成 → CodeBuild の PR 検証が通る → レビュー → "Squash and merge"
# → パイプラインが起動し dev → staging まで自動で進む
```

> **`--force-with-lease` は自分だけが使うブランチに限ります。** 「自分が最後に見た状態から誰も push していなければ上書きする」という安全装置付きの強制 push です。`--force-if-includes` を付けると、手元に取り込んでいない他人の push を誤って消すことも防げます。`main` や `hotfix/*` ではブランチ保護で force push 自体を禁止します。

### main を常にリリース可能に保つ

main へのマージは、そのまま本番へのリリース候補になります。

- **PR は小さく**: 数百行以内を目安にする
- **未完成の機能は機能フラグで隠す**: コードは main に入れつつ、本番では無効にしておく（AWS AppConfig の機能フラグなど）
- **DB・API の変更は互換性を保って段階的に**: 追加 → 移行 → 削除の順に、別々のリリースで行う
- **壊したらすぐ直すか、`git revert` で戻す**: main を止めない

### ブランチ名・コミットメッセージ

[Conventional Commits](https://www.conventionalcommits.org/) の型を使います。

| 型 | 意味 | ブランチ例 | squash 後のコミット例 |
|---|---|---|---|
| `feat` | 機能追加 | `feat/user-search` | `feat: ユーザー検索 API を追加 (#123)` |
| `fix` | バグ修正 | `fix/login-timeout` | `fix: ログインのタイムアウトを修正 (#124)` |
| `chore` | 雑務・依存更新 | `chore/schema-bump` | `chore(schema): スキーマを a1b2c3d に更新 (#125)` |
| `refactor` | 振る舞いを変えない整理 | `refactor/repo-layer` | |
| `docs` / `test` / `ci` | 文書 / テスト / CI | | |

---

## 2-3. 本番リリース（人がやるのは承認だけ）

```
main にマージ → Build → dev → staging → ⏸ 承認待ち → prod → タグ prod-* を自動作成
```

1. staging で動作を確認する
2. CodePipeline の承認アクションで「承認」する
3. prod へのデプロイが成功すると、パイプラインがコミットに `prod-YYYYMMDD-HHMMSS` タグを打つ

本番の状況は Git から確認できます。

```bash
git fetch --tags
git tag -l 'prod-*' --sort=-refname | head -5             # 直近の本番リリース
git log --oneline $(git tag -l 'prod-*' --sort=-refname | head -1)..origin/main   # まだ本番に出ていない変更（just prod）
git log --oneline prod-20261012-150000..prod-20261013-101500   # 2 つのリリースの差分（リリースノート用）
```

> デプロイが失敗したときは、パイプラインがそのステージを**直前に成功した版へ自動でロールバック**します（V2 パイプラインのステージ失敗時ロールバック）。

---

## 2-4. 本番で障害が起きたら

### 対応の順番

```
① ロールバック（確認済みの前の版に戻す）  ← まずこれ。数分で戻せる
        │
② 原因を main で修正 → 通常どおり流す       ← main をそのまま出せるなら、これで終わり
        │ main をそのまま出せない場合だけ
③ hotfix（本番タグから cherry-pick）
```

**最初にやるのは修正ではなくロールバック**です。前の版のイメージは staging と本番で確認済みなので、新しく直したコードを急いで出すより安全です。

### ① ロールバック

```bash
just prod-rollback          # 1 つ前の成功版に戻す（実行 ID を指定することもできる）
```

`just prod-rollback` は、次の 2 つをまとめて行います。

1. 通常パイプラインの **Prod への進行を止める**（`disable-stage-transition`）。戻した直後に、問題のあるコミットや新しいコミットが本番へ再び進まないようにするため
2. CodePipeline V2 の `rollback-stage` で、Prod ステージを前の成功した実行の版に戻す

原因を直して本番に出せる状態になったら、`just prod-unfreeze` で再開します。

> 今の本番が hotfix 用パイプラインから出たものなら、hotfix 用パイプライン側で戻します（`just pipeline=backend-hotfix prod-rollback`）。

### ② main で修正して通常どおり流す

修正が小さく、main の他の変更も本番に出して問題なければ、**通常どおり main にマージして流すのが最速かつ最も安全**です。hotfix は使いません。

### ③ hotfix を使うのは「main をそのまま出せない」ときだけ

例: main に、本番に出す前の確認がまだ必要な変更が入っている。

```bash
# 1. いつも通り fix/* → PR → main に squash merge（修正は必ず main が先）
#    マージされたコミットの SHA を控える（例: 9f8e7d6）

# 2. 最新の本番タグから hotfix ブランチを切って cherry-pick し、検査まで行う
just hotfix 9f8e7d6

# 3. 通常パイプラインが本番に進まないよう止める（人の注意ではなく仕組みで止める）
just prod-freeze "hotfix 対応中"

# 4. push → hotfix 用パイプラインが起動 → staging → 承認 → prod
git push

# 5. 本番に出たら再開
just prod-unfreeze
```

`just hotfix` の中身（手で行う場合）:

```bash
git fetch --tags
TAG=$(git tag -l 'prod-*' --sort=-refname | head -1)
git switch -c "hotfix/$TAG" "$TAG"
git cherry-pick -x 9f8e7d6
git submodule update --init --recursive                    # cherry-pick はサブモジュールの中身を更新しない
git show origin/main:scripts/check-hotfix.sh | bash -s -- "$TAG"   # main 側の検査スクリプトで検査
```

### hotfix の検査（パイプラインでも自動で実行）

hotfix 用パイプラインの Build では、**main 側の** `scripts/check-hotfix.sh` が走ります。hotfix ブランチ側のスクリプトを使わないのは、hotfix の中で検査を書き換えられないようにするためです。

| 判定 | 条件 | 結果 |
|---|---|---|
| OK | 元のコミットが main にあり、**変更内容が元のコミットと同一** | 通過 |
| WARN | 衝突を解決したため内容が異なるが、コミットに `Conflict-Resolved: <説明>` がある | 通過。違いをログに出すので、**本番承認者が確認してから承認する** |
| NG | `-x` の記録がない / 元のコミットが main にない / 内容が違うのに説明がない / マージコミットがある | ビルド失敗 |

衝突を解決したときは、コミットメッセージに説明を追記します。

```bash
git cherry-pick -x 9f8e7d6          # 衝突 → 解決 → git add
git cherry-pick --continue          # エディタで以下を追記して保存
#   Conflict-Resolved: hotfix 側には UserRepo が無いため、旧 API の呼び出しに合わせた
```

#### 原理: 「中身が同じ」をどう判定しているか

- `(cherry picked from commit X)` の行は手で書けるので、それだけでは中身が本物か分かりません
- そこで、元のコミットと hotfix のコミットの**変更内容の指紋**（`git patch-id`）を比べます
- このとき、前後の行（文脈）を除いて比べます（`git diff-tree -p -U0`）。hotfix は古い版から切るので、きれいに cherry-pick できても周りの行が main と違うことがあるためです

```bash
git diff-tree -p -U0 <コミット> | git patch-id --stable    # 変更内容の指紋
```

本番に出た時点で、パイプラインが hotfix のコミットにも `prod-*` タグを打ちます。次の hotfix は、そのタグから切ればよいだけです。hotfix ブランチは main にマージしません（修正はすでに main にあるため）。デプロイが終わったら削除します。

### 複数コミット・衝突

```bash
git cherry-pick -x 1111111 2222222            # 列挙（古い順に書く）
git cherry-pick -x 1111111^..3333333          # 範囲（1111111 を含む）

# 衝突したら
git status                                    # 衝突ファイルを確認 → 編集して解決
git add <ファイル>
git cherry-pick --continue                    # やめる: git cherry-pick --abort
```

---

## 2-5. GitHub 側の設定（ルールを仕組みで強制する）

| 対象 | 設定 |
|---|---|
| `main` | PR 必須、**PR 検証（CodeBuild）の成功が必須**、**Code Owners のレビュー必須**、Squash merge のみ許可、force push 禁止 |
| `hotfix/*` | 作成・push できる人をリリース担当に限定、force push 禁止 |
| タグ `prod-*` | 作成はパイプラインのトークンのみ、削除・移動禁止 |
| `.github/CODEOWNERS` | `buildspec/` `scripts/` `infra/` などパイプラインに関わるファイルは担当チームの承認を必須に（[examples/CODEOWNERS](../examples/CODEOWNERS)） |

AWS 側では、本番の承認アクションを実行できる IAM ユーザー・ロールを限定し、**hotfix を push した人とは別の人が承認する**運用にします。

### やってはいけないこと

| NG | 理由 | 代わりに |
|---|---|---|
| 障害時にいきなり修正を本番へ急ぐ | 未確認のコードを焦って出すことになる | まずロールバック（`just prod-rollback`） |
| hotfix 中に通常パイプラインを止めない | 承認の押し間違いで、未完成の変更が本番に出る | `just prod-freeze` で仕組みとして止める |
| hotfix に直接コミット | main に修正が戻らず、次のリリースで不具合が再発する（CI でも弾かれる） | main で直して cherry-pick |
| hotfix を main にマージ | 修正は main にすでにあり、履歴が重複する | 何もしない（main が常に正） |
| 環境ごとに作り直したイメージを出す | staging で確認したものと別物が本番に出る | 同じダイジェストを昇格させる |
| 長期間生きる feature ブランチ | main との差が広がり、マージ時に壊れる | 機能フラグで隠して小さく main へ |
| 共有ブランチで `reset` / force push | 他の人の履歴が壊れる | `revert` |
