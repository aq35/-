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

## リリース・緊急修正

| やりたいこと | コマンド / 操作 | just |
|---|---|---|
| 本番に出す | staging を確認 → CodePipeline で「承認」 | — |
| 今の本番と未リリースの変更を見る | `git log --oneline $(git tag -l 'prod-*' --sort=-refname \| head -1)..origin/main` | `just prod` |
| 緊急修正を運ぶ | `git switch -c hotfix/<本番タグ> <本番タグ> && git cherry-pick -x <sha>` → `git push` | `just hotfix <sha>` |
| hotfix の中身を検査 | `bash scripts/check-hotfix.sh <本番タグ>` | （`just hotfix` が実行） |
| デプロイを戻す | 失敗時は自動ロールバック。手動なら main で `git revert` して流す | — |

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
| PR を作成・更新 | CodeBuild で PR 検証（main へのマージ条件） |
| `main` へマージ | Build → dev → staging まで自動。承認後に prod |
| `hotfix/*` を push | hotfix 用パイプラインで Build → dev → staging → 承認 → prod |
| prod へのデプロイ成功 | パイプラインがタグ `prod-*` を自動で作成 |
