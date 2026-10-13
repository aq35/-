# 2. ブランチ戦略（チェリーピック運用）

## 2-1. 全体像

```
                 feat/*  fix/*   （短命: 数時間〜数日）
                   │       │  PR + squash merge
                   ▼       ▼
main ──●──●──●──●──●──●──●──●──●──▶      → 開発環境 (dev)
          \              │
           \             │ cherry-pick -x （修正だけを選んで運ぶ）
            ▼            ▼
release/1.4 ●────────────●───▶           → 検証環境 (staging)
            v1.4.0       v1.4.1          → タグ push で本番 (prod)
```

| ブランチ / タグ | 役割 | 誰が更新するか | デプロイ先 |
|---|---|---|---|
| `main` | 開発の本流。常にビルドが通る | PR の squash merge のみ | dev |
| `feat/*` `fix/*` `chore/*` | 作業用。main から切って main へ戻す | 各開発者 | — |
| `release/X.Y` | リリース系列。main から切り出す | `cherry-pick -x` の PR のみ | staging |
| タグ `vX.Y.Z` | 本番に出す版 | リリース担当 | prod |

### なぜこの形か

- **ブランチが 2 種類（main と release）しかない** → 覚えることが少ない
- **修正は必ず main が先** → 「本番だけ直って main に戻し忘れた」が起きない
- **release には選んだ修正だけ入る** → main で開発中の未完成機能が本番に混ざらない
- **squash merge で 1 PR = 1 コミット** → チェリーピックの単位がそのまま PR になる

> git-flow の `develop` / `hotfix` ブランチは使いません。`main` が develop の役、`release/*` への cherry-pick が hotfix の役を兼ねます。

---

## 2-2. 日々の開発（main へ）

```bash
git switch main && git pull                  # 最新化
git switch -c feat/user-search               # 作業ブランチ作成

# ...編集...
git add -p                                   # 変更を選んでステージ
git commit -m "feat: ユーザー検索 API を追加"

git fetch && git rebase origin/main          # 最新 main に追従（必要なとき）
git push                                     # push.autoSetupRemote で -u 不要
# → GitHub で PR 作成 → レビュー → "Squash and merge"
```

マージ後の掃除:

```bash
git switch main && git pull
git branch -d feat/user-search
git fetch --prune                            # 消えたリモートブランチを掃除
```

### ブランチ名・コミットメッセージ

[Conventional Commits](https://www.conventionalcommits.org/) の型をそのまま使うと、ブランチ名とメッセージが揃って覚えやすくなります。

| 型 | 意味 | ブランチ例 | squash 後のコミット例 |
|---|---|---|---|
| `feat` | 機能追加 | `feat/user-search` | `feat: ユーザー検索 API を追加 (#123)` |
| `fix` | バグ修正 | `fix/login-timeout` | `fix: ログインのタイムアウトを修正 (#124)` |
| `chore` | 雑務・依存更新 | `chore/schema-bump` | `chore(schema): スキーマを a1b2c3d に更新 (#125)` |
| `refactor` | 振る舞いを変えない整理 | `refactor/repo-layer` | |
| `docs` / `test` / `ci` | 文書 / テスト / CI | | |

---

## 2-3. リリースの切り出し（main → release）

main の「ここまでを次のリリースにする」地点からブランチを切ります。

```bash
git switch main && git pull
git switch -c release/1.5
git push                                      # → staging に自動デプロイ
```

staging で確認できたら、タグを打って本番へ。

```bash
git tag -a v1.5.0 -m "Release 1.5.0"
git push origin v1.5.0                        # → prod に自動デプロイ
```

---

## 2-4. リリース後の修正（main → cherry-pick → release）

**本番の不具合も、まず main で直します。** その後、修正コミットだけを release に運びます。

```bash
# ① いつも通り fix/* ブランチで修正 → PR → main に squash merge
#    マージされたコミットの SHA を控える（例: 9f8e7d6）

# ② release ブランチから運搬用ブランチを切る
git fetch
git switch -c pick/1.5/login-timeout origin/release/1.5

# ③ チェリーピック（-x で "(cherry picked from commit 9f8e7d6)" が残る）
git cherry-pick -x 9f8e7d6

# ④ push → release/1.5 宛てに PR → マージ → staging で確認
git push

# ⑤ 本番へ
git switch release/1.5 && git pull
git tag -a v1.5.1 -m "Release 1.5.1: ログインのタイムアウト修正"
git push origin v1.5.1
```

### 複数コミットをまとめて運ぶ

```bash
git cherry-pick -x 1111111 2222222 3333333    # 列挙（古い順に書く）
git cherry-pick -x 1111111^..3333333          # 範囲（1111111 を含む）
```

### コンフリクト（衝突）したら

```bash
git status                       # 衝突ファイルを確認
# ...ファイルを編集して解決...
git add <解決したファイル>
git cherry-pick --continue       # 続行
# やめたいとき: git cherry-pick --abort
```

`rerere.enabled = true`（[examples/gitconfig](../examples/gitconfig)）にしておくと、**同じ衝突の解決を Git が覚えて自動で再適用**します。複数の release に同じ修正を運ぶときに効きます。

### 「どの修正が release に入っているか」を調べる

```bash
# main にあって release/1.5 にまだ無いコミット（同等パッチは除外して表示）
git log --oneline --cherry-pick --right-only origin/release/1.5...origin/main

# あるコミットが運ばれたか（-x の記録を検索）
git log origin/release/1.5 --grep "cherry picked from commit 9f8e7d6"

# 前回リリースからの変更一覧（リリースノート用）
git log --oneline v1.5.0..v1.5.1
```

---

## 2-5. ルールまとめ（ブランチ保護で強制する）

GitHub の Branch protection / Rulesets で次を設定すると、ルールを「覚える」必要すらなくなります。

| 対象 | 設定 |
|---|---|
| `main` | PR 必須、CI 必須、**Squash merge のみ許可**、force push 禁止 |
| `release/*` | PR 必須、CI 必須、force push 禁止、削除禁止 |
| タグ `v*` | 作成をリリース担当に限定、削除・移動禁止 |

### やってはいけないこと

| NG | 理由 | 代わりに |
|---|---|---|
| release に直接コミット | main に修正が戻らず、次のリリースで不具合が再発 | main で直して cherry-pick |
| release を main にマージ | release 専用の変更が main に逆流し、履歴が複雑化 | 何もしない（main が常に正） |
| 共有ブランチで `reset` / force push | 他の人の履歴が壊れる | `revert` |
| 打ったタグを付け直す | 何が本番に出たのか追えなくなる | 新しいパッチ番号で打つ |
| `cherry-pick` で `-x` を省く | 運搬元を追跡できない | 常に `-x`（エイリアス `git cp` で固定） |

### バージョン番号の付け方

| 変更 | 例 | どこで打つ |
|---|---|---|
| 新しいリリース系列 | `v1.5.0` | `release/1.5` を切った直後 |
| 修正だけのリリース | `v1.5.1` `v1.5.2` | cherry-pick 後の `release/1.5` |
| 互換性を壊す変更 | `v2.0.0` | `release/2.0` |
