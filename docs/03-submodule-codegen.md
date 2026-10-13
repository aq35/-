# 3. サブモジュールとコード生成

## 3-1. サブモジュールの正体

親リポジトリ（backend）は、サブモジュールの**中身ではなく「どのコミットを使うか」の ID だけ**を記録しています（これを gitlink と呼びます）。

```
backend のコミット ──記録──▶ schema/ = a1b2c3d（schema リポジトリのコミット ID）
```

つまり:

- **スキーマのバージョン ＝ backend が記録しているコミット ID**
- スキーマを更新するとは「その ID を書き換えて backend にコミットする」こと
- ID が書き換わったコミットは、普通のコミットと同じく **cherry-pick できる**

```bash
git submodule status
#  a1b2c3d4... schema (v2.3.0)      ← 先頭の記号: 空白=一致 / + =ズレ / - =未初期化
git ls-tree HEAD schema
# 160000 commit a1b2c3d4...  schema  ← 160000 が gitlink の印
```

## 3-2. 最初の設定（これで手間の 9 割が消える）

```bash
git config --global submodule.recurse true          # switch/pull 等でサブモジュールも自動で揃える
git config --global fetch.recurseSubmodules on-demand
git config --global push.recurseSubmodules check    # サブモジュールの未 push コミットを指したまま push するのを防ぐ
git config --global diff.submodule log              # diff でサブモジュールの変化をコミット一覧表示
git config --global status.submoduleSummary true    # status にサブモジュールの差分要約を表示
```

> `submodule.recurse = true` にすると、`git switch hotfix/prod-...` するだけでサブモジュールもそのブランチが記録しているスキーマに自動で切り替わります。**チェリーピック運用では必須級の設定**です。

## 3-3. 場面別の手順

### 新しく参加した / clone したとき

```bash
git clone --recurse-submodules <backend-url>
# clone 済みなら:
git submodule update --init --recursive
```

### サブモジュールを追加する（プロジェクト立ち上げ時に 1 回）

```bash
git submodule add -b main <schema-repo-url> schema
git commit -m "chore: GraphQL スキーマをサブモジュールとして追加"
```

`.gitmodules` が作られます:

```ini
[submodule "schema"]
	path = schema
	url = https://github.com/your-org/graphql-schema.git
	branch = main
```

> URL は **HTTPS 形式**にしておくと、CI（CodeBuild）がトークンでそのまま取得できます（[5-5](05-aws-pipeline.md#5-5-サブモジュールを-codebuild-で取得する)）。手元で SSH を使いたい人は `git config --global url."git@github.com:".insteadOf "https://github.com/"` で読み替えられます。

### スキーマを最新に上げる（いちばんよくある作業）

```bash
git switch -c chore/schema-bump origin/main

git submodule update --remote schema     # schema を .gitmodules の branch の最新へ
git diff                                 # どのスキーマコミットが入るか確認（diff.submodule=log）

cargo build                              # build.rs が再生成 → コンパイルエラー = 対応が必要な箇所
# ...生成された型に合わせてリゾルバ等を修正...
cargo test

git add schema src/
git commit -m "chore(schema): スキーマを $(git -C schema rev-parse --short HEAD) に更新"
git push                                 # → PR → main へ squash merge
```

特定のバージョン（タグ）に合わせるとき:

```bash
git -C schema fetch --tags
git -C schema switch --detach v2.4.0
git add schema
```

### スキーマを変更して、そのまま backend でも使う

schema リポジトリ側の変更が先です。

```bash
# 1. schema リポジトリで PR → マージ（backend とは別の PR）
# 2. backend 側で上の「最新に上げる」手順を実行
```

> **schema の未マージのブランチを backend の main から指さない。** schema 側のブランチが消えると、そのコミットを誰も取得できなくなります。CI でチェックします（[examples/scripts/check-schema-pin.sh](../examples/scripts/check-schema-pin.sh)）。

### 別ブランチに移ったら schema がズレた（`+` が付いている）

```bash
git submodule update --init --recursive   # 記録されたコミットに戻す
```

`submodule.recurse = true` なら通常は起きません。

## 3-4. コード生成の方針

| 方針 | 生成コードを | チェリーピック時 | おすすめ |
|---|---|---|---|
| **A. `build.rs` でビルド時に生成** | コミットしない（`OUT_DIR` に出力） | 衝突は gitlink 1 行だけ | ◎ |
| B. 生成コマンドを手で実行してコミット | コミットする | 生成ファイルでも衝突しやすい | ○（差分レビューしたい場合） |

**A をおすすめします。** スキーマのバージョンと生成コードが必ず一致し、「生成し忘れ」がそもそも起きません。雛形は [examples/build.rs](../examples/build.rs) を参照してください。

B を選ぶ場合は、`buildspec/build.yml` と、`infra/pipeline.yml` 内の PR 検証の buildspec に「再生成して `git diff --exit-code` で差分が出ないこと」の検査を追加します。

> **コードファースト（async-graphql などで Rust から SDL を出力する）構成の場合**は、生成の向きが逆になります。その場合は「Rust から出力した SDL と `schema/schema.graphql` が一致すること」を CI で検査すると、同じく 1 つのコミット ID でバージョンを管理できます。

## 3-5. スキーマ更新を hotfix で本番に出す（cherry-pick）

通常、スキーマ更新は main にマージすればパイプラインで本番まで流れます。main をそのまま出せないときだけ、hotfix で運びます（[2-4](02-branch-strategy.md#2-4-本番で障害が起きたら)）。

```bash
git fetch --tags
TAG=$(git tag -l 'prod-*' --sort=-refname | head -1)
git switch -c "hotfix/$TAG" "$TAG"
git cherry-pick -x <スキーマ更新コミットの SHA>
git submodule update --init --recursive   # ← 必須: cherry-pick はサブモジュールの中身までは更新しない
cargo build && cargo test
```

> `submodule.recurse = true` でも、**`cherry-pick` 後はサブモジュールの中身が古いまま**です（`git submodule status` で `+` が付く）。そのままビルドすると古いスキーマで生成されるので、必ず `git submodule update` を挟みます。

### gitlink が衝突したとき

hotfix 側で別のスキーマ更新を先に運んでいた場合などに起きます。

```bash
git status
#   both modified:   schema

# 使いたいスキーマのコミットを明示して解決
git -C schema switch --detach <使うコミット>
git add schema
cargo build && cargo test               # 生成し直して確認
git cherry-pick --continue
```

### 注意: 「スキーマの互換性」を先に確認する

スキーマを本番に出す = 本番 API の形が変わる、ということです。出す前に差分を確認しましょう。

```bash
git diff "$TAG" origin/main -- schema                                  # 何コミット分進むか（diff.submodule=log）
git -C schema diff <本番側のSHA> <main側のSHA> -- schema.graphql         # SDL の差分そのもの
```

**フィールドの削除・型の変更（破壊的変更）は一度に出さない**のが原則です。クライアントが追従できるよう「新フィールド追加 → クライアント移行 → 旧フィールドを `@deprecated` → 削除」と、別々のリリースに分けます。

## 3-6. スキーマを複数のサービス・フロントエンドで共有する運用

スキーマは backend だけでなく、他のサービスやフロントエンドも使っています。そのため、**スキーマ専用リポジトリを分ける今の構成を続けます**。統合すると、他のサービスが backend のリポジトリに依存することになるためです。

その代わり、サブモジュールの手間と、スキーマ変更による事故を次の 3 つで減らします。

```
 schema リポジトリ                          backend / 他サービス / フロントエンド
 ┌─────────────────────────────┐            ┌──────────────────────────────┐
 │ PR → 破壊的変更チェック（CI）   │   main     │ Dependabot が「schema 更新」PR │
 │    → レビュー → main へマージ  │ ─────────▶ │ を自動作成 → ビルド・テスト    │
 └─────────────────────────────┘            └──────────────────────────────┘
```

### ① schema リポジトリで、破壊的変更を CI で止める

フィールドの削除や型の変更は、どこか 1 つの利用者を壊します。schema リポジトリの PR 検証で、main と比べて検出します。

```bash
npx @graphql-inspector/cli diff 'git:origin/main:schema.graphql' schema.graphql
```

| EN | 読み | JP |
|---|---|---|
| Diff the schema against main. | ディフ ザ スキーマ アゲンス(ト) メイン | main のスキーマと比べて、破壊的変更があれば失敗させる |

破壊的変更が必要なときは、利用者が追従できるよう段階を分けます。

| 段階 | schema リポジトリ | 利用者（backend・他サービス・フロント） |
|---|---|---|
| 1 | 新しいフィールドを**追加** | — |
| 2 | 古いフィールドに `@deprecated(reason: "...")` を付ける | 新しいフィールドへ移行 |
| 3 | 全利用者の移行を確認してから**削除** | — |

### ② backend では Dependabot に更新 PR を作らせる

[examples/dependabot.yml](../examples/dependabot.yml) を `.github/dependabot.yml` に置くと、schema の main が進むたびに「サブモジュールを最新にする PR」が自動で作られます。PR 検証でコード生成とテストが走るので、**追従が必要かどうかがマージ前に分かります**。人が `git submodule update --remote` を打つ必要はほぼなくなります。

### ③ 自分でスキーマを変えるときは、マージ後に差し替える

自分の機能のためにスキーマを変える場合は、[6-④](06-daily-commands.md#4-バックエンドが指すサブモジュールのコミット-id-を差し替える) の手順です。

1. schema 側で PR を出す
2. backend では、作業中はその PR のコミットを指して開発する
3. schema 側でマージされたら、backend の記録を schema の main 側のコミットに差し替える

squash merge でコミット ID が変わるためです。差し替え忘れは、PR 検証の「schema が main にあるか」の検査で止まります。

