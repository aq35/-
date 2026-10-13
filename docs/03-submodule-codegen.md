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

> `submodule.recurse = true` にすると、`git switch release/1.5` するだけでサブモジュールも release/1.5 が記録しているスキーマに自動で切り替わります。**チェリーピック運用では必須級の設定**です。

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

> URL は **HTTPS 形式**にしておくと、CI（GitHub Actions）がトークンでそのまま取得できます。手元で SSH を使いたい人は `git config --global url."git@github.com:".insteadOf "https://github.com/"` で読み替えられます。

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

> **schema の未マージのブランチを backend の main から指さない。** schema 側のブランチが消えると、そのコミットを誰も取得できなくなります。CI でチェックします（[examples/ci.yml](../examples/ci.yml)）。

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

B を選ぶ場合は、CI で「再生成して差分が出ないこと」を検査します（[examples/ci.yml](../examples/ci.yml) にコメントで記載）。

> **コードファースト（async-graphql などで Rust から SDL を出力する）構成の場合**は、生成の向きが逆になります。その場合は「Rust から出力した SDL と `schema/schema.graphql` が一致すること」を CI で検査すると、同じく 1 つのコミット ID でバージョンを管理できます。

## 3-5. スキーマ更新を release に運ぶ（cherry-pick）

スキーマ更新コミットも、通常の修正と同じく cherry-pick で運べます。

```bash
git switch -c pick/1.5/schema-bump origin/release/1.5
git cherry-pick -x <スキーマ更新コミットの SHA>
git submodule update --init --recursive   # ← 必須: cherry-pick はサブモジュールの中身までは更新しない
cargo build && cargo test
```

> `submodule.recurse = true` でも、**`cherry-pick` 後はサブモジュールの中身が古いまま**です（`git submodule status` で `+` が付く）。そのままビルドすると古いスキーマで生成されるので、必ず `git submodule update` を挟みます。

### gitlink が衝突したとき

release 側で別のスキーマ更新を先に運んでいた場合などに起きます。

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

release に新しいスキーマを運ぶ = 本番 API の形が変わる、ということです。運ぶ前に差分を確認しましょう。

```bash
git diff origin/release/1.5 origin/main -- schema          # 何コミット分進むか（diff.submodule=log）
git -C schema diff <release側のSHA> <main側のSHA> -- schema.graphql   # SDL の差分そのもの
```

**フィールドの削除・型の変更（破壊的変更）は release に運ばない**のが原則です。破壊的変更は次の `release/X.Y` で出します。
