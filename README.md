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

| # | ドキュメント | 内容 |
|---|---|---|
| 1 | [コマンド一覧（英語訳・日本語訳）](docs/01-commands.md) | よく使うコマンドを英単語の意味つきで |
| 2 | [ブランチ戦略（チェリーピック運用）](docs/02-branch-strategy.md) | 開発 → 検証 → 本番 の流れ |
| 3 | [サブモジュールとコード生成](docs/03-submodule-codegen.md) | スキーマ更新から生成までの手順 |
| 4 | [チートシート](docs/04-cheatsheet.md) | 1 ページで全体を見返す用 |

設定ファイルのサンプル:

| ファイル | 用途 |
|---|---|
| [examples/gitconfig](examples/gitconfig) | 推奨 Git 設定とエイリアス |
| [examples/justfile](examples/justfile) | よく使う操作を 1 コマンドにまとめたタスク定義 |
| [examples/build.rs](examples/build.rs) | サブモジュールのスキーマからコード生成する雛形 |
| [examples/ci.yml](examples/ci.yml) | GitHub Actions（サブモジュール・生成チェック） |

## 覚えるのは 4 つのルールだけ

1. **すべての変更はまず `main` へ**（Upstream First）
2. **`release/*` へは `cherry-pick -x` でしか入れない**
3. **本番を動かすのはタグ `v*` だけ**
4. **スキーマ更新は「サブモジュール更新 ＋ 生成コードの追従」を 1 コミットで**

```
main ──●──●──●──●──●──●──▶        開発環境 (dev) に自動デプロイ
            \        │ cherry-pick -x
release/1.4  ●───────●──▶          検証環境 (staging) に自動デプロイ
             v1.4.0  v1.4.1        タグ = 本番 (prod) リリース
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
