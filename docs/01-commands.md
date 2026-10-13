# 1. コマンド一覧（英語訳・日本語訳）

コマンド名は英単語そのものです。**単語の意味を知ると、動作が自然に覚えられます。**

各表の見方:

- **英単語の意味** … コマンド名の直訳（覚えるためのヒント）
- **English** … 何をするか（英語）
- **日本語** … 何をするか（日本語）

> 新しめの Git（2.23 以降）では `checkout` の役割が `switch`（ブランチ切替）と `restore`（ファイル復元）に分かれました。このガイドは新しい方を使います。

---

## 1-1. 設定 — config

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git config --global user.name "名前"` | config = 設定 | Set your name for commits | コミットに記録する名前を設定 |
| `git config --global user.email "メール"` | | Set your email for commits | コミットに記録するメールを設定 |
| `git config --list --show-origin` | list = 一覧 | Show all settings and where they come from | 全設定と、その定義ファイルを表示 |

## 1-2. はじめる — init / clone

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git init` | initialize = 初期化する | Create a new repository | 新しいリポジトリを作る |
| `git clone <url>` | clone = 複製 | Copy a remote repository | リモートのリポジトリを複製する |
| `git clone --recurse-submodules <url>` | recurse = 再帰的に | Clone including submodules | サブモジュールも含めて複製する |

## 1-3. 状態を見る — status / log / diff / show

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git status -sb` | status = 状態 / short, branch | Show changed files (short form) | 変更ファイルを簡潔に表示 |
| `git log --oneline --graph` | log = 記録・航海日誌 | Show history as a graph | 履歴をグラフで表示 |
| `git log -p <file>` | patch = 差分 | Show history with diffs of a file | ファイルの変更履歴を差分つきで表示 |
| `git diff` | difference = 差分 | Show unstaged changes | まだステージしていない変更を表示 |
| `git diff --staged` | staged = 舞台に上げた | Show staged changes | ステージ済み（次にコミットされる）変更を表示 |
| `git show <commit>` | show = 見せる | Show one commit in detail | 1 つのコミットの詳細を表示 |

## 1-4. 変更を記録する — add / commit

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git add <file>` | add = 加える | Stage a file | ファイルをステージ（コミット候補）に加える |
| `git add -p` | patch = 部分 | Stage changes hunk by hunk | 変更を塊ごとに選んでステージ（**おすすめ**） |
| `git commit -m "msg"` | commit = 確定する・委ねる | Record staged changes | ステージした変更を履歴に確定する |
| `git commit --amend` | amend = 修正する | Fix the last commit | 直前のコミットを修正する（push 前のみ） |

## 1-5. ブランチ — switch / branch / merge / rebase

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git switch <branch>` | switch = 切り替える | Move to a branch | ブランチを切り替える |
| `git switch -c <branch>` | create = 作る | Create and move to a branch | ブランチを作って切り替える |
| `git switch -` | | Go back to the previous branch | 直前のブランチに戻る |
| `git branch` | branch = 枝 | List local branches | ローカルブランチ一覧 |
| `git branch -d <branch>` | delete = 削除 | Delete a merged branch | マージ済みブランチを削除 |
| `git merge <branch>` | merge = 合流する | Combine a branch into the current one | 他のブランチを今のブランチに合流させる |
| `git rebase origin/main` | rebase = 土台を付け替える | Replay your commits on top of main | 自分のコミットを最新 main の上に積み直す |

## 1-6. リモートと同期 — fetch / pull / push

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git fetch` | fetch = 取ってくる | Download remote changes (no merge) | リモートの更新を取得だけする（作業は変えない） |
| `git pull` | pull = 引っぱる | Fetch and integrate | 取得して今のブランチに取り込む |
| `git push` | push = 押し出す | Upload your commits | 自分のコミットをリモートへ送る |
| `git push --force-with-lease` | lease = 借用契約 | Force push safely | 他人の更新を消さない安全な強制 push |

## 1-7. 取り消す — restore / reset / revert

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git restore <file>` | restore = 元に戻す | Discard changes in a file | ファイルの変更を破棄する |
| `git restore --staged <file>` | | Unstage a file | ステージを取り消す（変更は残る） |
| `git reset --soft HEAD~1` | reset = 再設定 / soft = 柔らかく | Undo last commit, keep changes staged | 直前のコミットを取り消し、変更はステージに残す |
| `git revert <commit>` | revert = 元に戻す | Create a commit that undoes another | 打ち消しコミットを作る（**共有済みの履歴はこれで戻す**） |

> 迷ったら: **push 前 → `reset` / `amend`、push 後 → `revert`**

## 1-8. 一時退避 — stash

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git stash -u` | stash = こっそりしまう / untracked | Save work temporarily (incl. new files) | 作業中の変更を一時退避（新規ファイルも） |
| `git stash pop` | pop = 取り出す | Restore the latest stash | 最後に退避したものを戻す |
| `git stash list` | | List stashes | 退避一覧 |

## 1-9. チェリーピック — cherry-pick ★このガイドの主役

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git cherry-pick -x <commit>` | cherry-pick = 良いものだけ摘み取る | Copy a commit onto the current branch | 特定のコミットだけを今のブランチに複製する。`-x` で元コミットを記録 |
| `git cherry-pick -x A^..B` | | Copy a range of commits (A to B) | A〜B の範囲をまとめて複製 |
| `git cherry-pick --continue` | continue = 続ける | Continue after resolving conflicts | 衝突を解決した後に続行 |
| `git cherry-pick --abort` | abort = 中止する | Cancel and go back | 中止して元に戻す |

## 1-10. タグ — tag

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git tag -a v1.4.0 -m "msg"` | tag = 札 / annotated = 注釈つき | Create an annotated tag | 注釈つきタグ（リリース印）を作る |
| `git push origin v1.4.0` | | Push a tag | タグをリモートへ送る（= 本番リリース） |
| `git tag -l "v1.4.*"` | list | List matching tags | 条件に合うタグを一覧 |
| `git describe --tags` | describe = 説明する | Show nearest tag | 現在地から最も近いタグを表示 |

## 1-11. サブモジュール — submodule

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git submodule add <url> schema` | sub + module = 部品の中の部品 | Add a repository as a submodule | 別リポジトリを部品として組み込む |
| `git submodule update --init --recursive` | update = 更新 / init = 初期化 | Checkout the recorded submodule commit | 記録されたコミットにサブモジュールを揃える |
| `git submodule update --remote schema` | remote = 遠隔 | Move submodule to latest remote commit | サブモジュールをリモートの最新に進める |
| `git submodule status` | | Show submodule commits | サブモジュールが指すコミットを表示 |
| `git -C schema <command>` | C = change directory | Run a command inside the submodule | サブモジュール内でコマンドを実行（cd 不要） |
| `git diff --submodule=log` | | Show submodule changes as log | サブモジュールの変化をコミット一覧で表示 |

## 1-12. 調査・救出 — blame / bisect / reflog

| コマンド | 英単語の意味 | English | 日本語 |
|---|---|---|---|
| `git blame <file>` | blame = 責める | Show who changed each line | 各行を最後に変更したコミットを表示 |
| `git bisect start` | bisect = 二等分する | Binary search for a bad commit | 不具合を入れたコミットを二分探索で探す |
| `git reflog` | ref + log = 参照の記録 | Show where HEAD has been | HEAD の移動履歴（**消したコミットの救出に使う**） |
| `git log -S "keyword"` | S = string | Find commits that added/removed text | ある文字列を追加・削除したコミットを探す |

---

## 用語ミニ辞典

| 用語 | 英語の意味 | Git での意味 |
|---|---|---|
| repository | 貯蔵庫 | 履歴を含むプロジェクト全体 |
| working tree | 作業する木 | 今編集しているファイル群 |
| staging area / index | 舞台袖 / 索引 | 次のコミットに入れる変更の置き場 |
| HEAD | 先頭 | 今いる場所（今のコミット） |
| origin | 起源 | clone 元のリモートの既定名 |
| upstream | 上流 | 変更の流れの源。このガイドでは `main` |
| hunk | 塊 | diff の変更のひとかたまり |
| gitlink | | 親リポジトリが記録する「サブモジュールのコミット ID」 |
| fast-forward | 早送り | 分岐がないので、ブランチの先端を進めるだけで済むマージ |
