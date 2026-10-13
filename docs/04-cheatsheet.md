# 4. チートシート

エイリアスは [examples/gitconfig](../examples/gitconfig)、`just` タスクは [examples/justfile](../examples/justfile) を入れた前提です。

## 毎日

| やりたいこと | コマンド | エイリアス / just |
|---|---|---|
| 最新の main から作業開始 | `git switch main && git pull && git switch -c feat/xxx` | `just start feat/xxx` |
| 状態確認 | `git status -sb` | `git st` |
| 履歴をグラフで見る | `git log --oneline --graph --decorate -20` | `git lg` |
| 選んでステージ | `git add -p` | `git ap` |
| コミット | `git commit -m "feat: ..."` | `git ci -m "..."` |
| main に追従 | `git fetch && git rebase origin/main` | `git sync` |
| push | `git push` | — |
| マージ済みを掃除 | `git switch main && git pull && git fetch --prune` | `just tidy` |

## スキーマ

| やりたいこと | コマンド | just |
|---|---|---|
| サブモジュールを揃える | `git submodule update --init --recursive` | `just setup` |
| スキーマを最新に | `git submodule update --remote schema` | `just schema-bump` |
| 何が変わるか見る | `git diff --submodule=log` | — |
| サブモジュール内で操作 | `git -C schema <cmd>` | — |

## リリース

| やりたいこと | コマンド | just |
|---|---|---|
| リリース系列を切る | `git switch -c release/1.5 origin/main && git push` | `just release-cut 1.5` |
| 修正を運ぶ | `git switch -c pick/1.5/xxx origin/release/1.5 && git cherry-pick -x <sha>` | `just pick 1.5 <sha>` |
| 運び漏れを確認 | `git log --oneline --cherry-pick --right-only origin/release/1.5...origin/main` | `just missing 1.5` |
| 本番リリース | `git tag -a v1.5.1 -m "..." && git push origin v1.5.1` | `just ship v1.5.1` |

## 困ったとき

| 状況 | コマンド |
|---|---|
| 直前のコミットメッセージを直したい（push 前） | `git commit --amend` |
| 直前のコミットを取り消したい（push 前） | `git reset --soft HEAD~1` |
| push 済みのコミットを取り消したい | `git revert <sha>` |
| ファイルの変更を捨てたい | `git restore <file>` |
| ステージを外したい | `git restore --staged <file>` |
| 作業を一時退避 | `git stash -u` → `git stash pop` |
| cherry-pick が衝突 | 解決 → `git add` → `git cherry-pick --continue`（中止: `--abort`） |
| cherry-pick 後にサブモジュールに `+` が付いた | `git submodule update --init --recursive`（cherry-pick は中身を更新しない） |
| サブモジュールに `+` が付いた | `git submodule update --init --recursive` |
| 消したコミットを取り戻したい | `git reflog` → `git switch -c rescue <sha>` |
| どのコミットで壊れたか探したい | `git bisect start` → `git bisect bad` → `git bisect good <sha>` |

## 環境とトリガー

| Git の操作 | 結果 |
|---|---|
| `main` へマージ | dev にデプロイ |
| `release/*` へ push / マージ | staging にデプロイ |
| タグ `v*` を push | prod にデプロイ |
