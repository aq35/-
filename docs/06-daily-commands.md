# 6. 普段の作業コマンド集（バックエンド × スキーマサブモジュール）

毎日の作業で使う Git コマンドを、**やりたいこと別**にまとめました。コードブロックは右上のボタンでそのままコピーできます。

## 凡例

各コマンドの下に、英語・読み方・日本語訳を付けています。

| EN | コマンドの意味を英語で（`‿` は音がつながる＝リンキングする場所） |
|:---|:---|
| 読み | カタカナ読み。英文と同じ位置に `‿` を入れています（`(ト)` は弱くなる・ほぼ発音しない音） |
| つながり | どの単語と単語が、どの型でつながるか（[リンキングの解説](en-study/linking.md)） |
| JP | 日本語訳 |

- サブモジュールのディレクトリ名は `schema` としています
- `git -C schema ...` は「`schema` の中で実行する」という意味です（↓ 詳しく）

## `-C`（ハイフン C）の意味

```bash
git -C schema status
```

| EN | Run git‿as‿if‿it started‿in schema. |
|:---|:---|
| 読み | ラン ギッ‿タ‿ズィ‿フィッ(ト) スターティッ‿ディン スキーマ |
| つながり | git‿as（t＋母音（t がラ行に近い音になる）） ／ as‿if（子音＋母音） ／ if‿it（子音＋母音） ／ started‿in（子音＋母音） |
| JP | git を、schema ディレクトリで起動したかのように実行する |

- `-C` は **Change directory**（チェインジ ディレクトリー＝ディレクトリを変える）の頭文字です
- `git -C <パス> <コマンド>` は、「`<パス>` に移動してから `git <コマンド>` を実行する」のと同じ結果になります
- ただし、**今いる場所（カレントディレクトリ）は変わりません**。コマンドが終わっても、backend にいたままです
- `-C` は `git` の直後に書きます。`git status -C schema` のように後ろに書くとエラーになります（`unknown switch 'C'`）

### 図

```
 いる場所: backend/                          いる場所: backend/（変わらない）
     │                                           ▲
     │  git -C schema status                     │ 終わったら戻ってくる必要もない
     ▼                                           │
 ┌─ backend/ ─────────────────────────────┐      │
 │   schema/  ← ここで status を実行 ──────┼──────┘
 └────────────────────────────────────────┘
```

### `cd` との比較

```bash
# cd を使う場合（3 行・戻り忘れの危険あり）
cd schema
git status
cd ..

# -C を使う場合（1 行・いる場所は backend のまま）
git -C schema status
```

| | `cd schema` してから実行 | `git -C schema ...` |
|---|---|---|
| いる場所 | schema に変わる | backend のまま |
| 戻り忘れ | 起きる（backend のつもりで schema に commit してしまう） | 起きない |
| コピー＆ペースト | 前後の `cd` も必要 | 1 行で完結 |

**サブモジュールの操作では、どちらのリポジトリに対する操作かが 1 行で分かる `-C` を使います。**

### 確認

```bash
pwd && git rev-parse --show-toplevel && git -C schema rev-parse --show-toplevel
```

| EN | Show where‿I am, and the top‿of‿each repository. |
|:---|:---|
| 読み | ショウ ウェア‿ライ アム、アン(ド) ザ ト‿ポ‿ヴィーチ リポズィトリー |
| つながり | where‿I（r＋母音） ／ top‿of（子音＋母音） ／ of‿each（子音＋母音） |
| JP | 今いる場所と、backend・schema それぞれのリポジトリの最上位ディレクトリを表示する |

```
/home/you/backend           ← 今いる場所
/home/you/backend           ← git status などが対象にするリポジトリ
/home/you/backend/schema    ← git -C schema ... が対象にするリポジトリ
```

## 全体の流れ

```
              ┌──────────── backend（親） ────────────┐
              │                                        │
  ① 最新にする ─▶ ② 差分を確認 ─▶ ④ コミットID を差し替え ─▶ push
                       ▲                 ▲
                       │                 │
              ┌────────┴── schema（子） ──┴──┐
              │ ③ ブランチを切って修正・push   │
              └──────────────────────────────┘

  ⑤ マージ / リベースで schema が衝突したら → 使うコミットを選んで add
```

| # | やりたいこと | ジャンプ |
|---|---|---|
| ① | ブランチを最新にし、サブモジュールも記録どおりに揃えて表示する | [→](#1-ブランチを最新にしサブモジュールを追従させる) |
| ② | 変更差分が想定どおりか確認する | [→](#2-変更差分が想定どおりか確認する) |
| ③ | サブモジュールでブランチを切り、修正をコミット・プッシュする | [→](#3-サブモジュールでブランチを切って修正コミットプッシュ) |
| ④ | バックエンドが指すサブモジュールのコミット ID を差し替える | [→](#4-バックエンドが指すサブモジュールのコミット-id-を差し替える) |
| ⑤ | バックエンドでサブモジュールが衝突したときに対応する | [→](#5-サブモジュールのコンフリクト対応) |

### コマンドに出てくる単語の読み方

| 単語 | 読み | 意味 |
|---|---|---|
| fetch | フェッチ | 取ってくる |
| pull | プル | 引っぱる |
| push | プッシュ | 押し出す |
| switch | スウィッチ | 切り替える |
| submodule | サブモジュール | 部品の中の部品 |
| recursive | リカーシヴ | 再帰的に（中の中まで） |
| detach | ディタッチ | 切り離す |
| upstream | アップストリーム | 上流（追跡先） |
| staged | ステイジド | ステージした（舞台に上げた） |
| conflict | コンフリクト | 衝突 |
| abort | アボート | 中止する |
| ours / theirs | アワーズ / ゼアーズ | 自分の側 / 相手の側 |

---

## 1. ブランチを最新にし、サブモジュールを追従させる

### 図

```
 リモート origin                 手元
 ┌──────────────────┐   pull    ┌────────────────────────────┐
 │ main: C3          │ ───────▶ │ main: C3                    │
 │  └ schema = 970d12c│          │  └ schema の記録 = 970d12c   │
 └──────────────────┘          │  └ schema の中身 = beff35a ✗ │ ← pull だけだと古いまま
                               └────────────────────────────┘
                                         │ submodule update
                                         ▼
                                   schema の中身 = 970d12c ✓
```

### 手順

```bash
git switch main
```

| EN | Switch to main. |
|:---|:---|
| 読み | スウィッチュ トゥ メイン |
| つながり | なし（単語ごとに区切って読む） |
| JP | main ブランチに切り替える |

```bash
git pull
```

| EN | Pull the latest changes. |
|:---|:---|
| 読み | プル ザ レイテス(ト)チェインジズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | リモートの最新を取り込む |

```bash
git submodule update --init --recursive
```

| EN | Update‿all submodules to the recorded commit. |
|:---|:---|
| 読み | アップデイ‿ロール サブモジュールズ トゥ ザ リコーディッ(ド) カミッ(ト) |
| つながり | Update‿all（t＋母音（t がラ行に近い音になる）） |
| JP | すべてのサブモジュールを、親が記録しているコミットに揃える |

3 つをまとめて実行する場合:

```bash
git switch main && git pull && git submodule update --init --recursive
```

### 確認

```bash
git submodule status
```

| EN | Show the status‿of submodules. |
|:---|:---|
| 読み | ショウ ザ ステイタ‿ソヴ サブモジュールズ |
| つながり | status‿of（子音＋母音） |
| JP | サブモジュールが指しているコミットを表示する |

```
 970d12cb7a20a806eda8df38a47efd702268338b schema (remotes/origin/HEAD)
^
└ 先頭の記号: 空白 = 記録どおり ✓ / + = 記録とズレている / - = 未取得 / U = 衝突中
```

記録されたコミットと、実際のコミットを並べて比べる:

```bash
echo "記録: $(git rev-parse --short HEAD:schema)  実際: $(git -C schema rev-parse --short HEAD)"
```

| EN | Compare the recorded‿and‿actual commits. |
|:---|:---|
| 読み | カンペア ザ リコーディッ‿ダン‿ダクチュアル カミッツ |
| つながり | recorded‿and（子音＋母音） ／ and‿actual（子音＋母音） |
| JP | 記録されたコミットと実際のコミットを比べる |

```
記録: 970d12c  実際: 970d12c      ← 同じなら OK
```

```bash
git -C schema log --oneline -1
```

| EN | Show the latest commit‿in schema. |
|:---|:---|
| 読み | ショウ ザ レイテス(ト) カミッ‿ティン スキーマ |
| つながり | commit‿in（t＋母音（t がラ行に近い音になる）） |
| JP | schema が今いるコミットを 1 件表示する |

### 原理: なぜ `pull` だけではサブモジュールが古いままなのか

- 親（backend）が記録しているのは、サブモジュールの**中身ではなくコミット ID だけ**です。これを **gitlink** と呼びます
- `git pull` が更新するのは、親の「記録（gitlink）」までです。**サブモジュールの中身は自動では動きません**
- そのため、pull の直後は「記録 = 新しい / 中身 = 古い」となり、`git status` に `M schema`、`git submodule status` に `+` が出ます
- `git submodule update` が、中身を記録どおりのコミットへ移動させます

```bash
git ls-tree HEAD schema
# 160000 commit 970d12cb...  schema    ← 160000 が gitlink（コミット ID を記録しているだけ）の印
```

#### ヒント: 毎回 update を打たずに済ませる設定（一度だけ実行）

```bash
git config --global submodule.recurse true
```

| EN | Recurse‿into submodules‿automatically. |
|:---|:---|
| 読み | リカー‿サントゥ サブモジュール‿ゾートマティカリー |
| つながり | Recurse‿into（子音＋母音） ／ submodules‿automatically（子音＋母音） |
| JP | サブモジュールにも自動で反映する |

これで `git pull` や `git switch` のときに、サブモジュールも自動で揃います。

---

## 2. 変更差分が想定どおりか確認する

### 図: どこと比べているか

```
  作業ツリー ──(git add)──▶ ステージ ──(git commit)──▶ 自分のブランチ ──(PR)──▶ origin/main
  (編集中)                  (次のコミット)              (ローカル)
       └──── git diff ────┘└── git diff --staged ──┘└── git diff origin/main...HEAD ──┘
```

### 手順（上から順に見る）

```bash
git status -sb
```

| EN | Show a short status with the branch. |
|:---|:---|
| 読み | ショウ ア ショー(ト)ステイタス ウィズ ザ ブランチ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変更ファイルの一覧を短く表示する（ブランチ名つき） |

```
## feat/user-email
 M main.rs        ← 左の列 = ステージ済み / 右の列 = 未ステージ
 M schema         ← サブモジュールの指すコミットが変わっている
```

```bash
git diff --stat
```

| EN | Show a summary of changes. |
|:---|:---|
| 読み | ショウ ア サマリオヴ チェインジズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | どのファイルが何行変わったかの要約を表示する |

```bash
git diff
```

| EN | Show unstaged changes. |
|:---|:---|
| 読み | ショウ アンステイジ(ド)チェインジズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | まだステージしていない変更の中身を表示する |

```bash
git diff --staged
```

| EN | Show staged changes — what will be committed. |
|:---|:---|
| 読み | ショウ ステイジ(ド)チェインジズ ワッウィル ビー カミティッド |
| つながり | なし（単語ごとに区切って読む） |
| JP | ステージ済みの変更（次のコミットに入る内容）を表示する |

### サブモジュールの差分を確認する

```bash
git diff --submodule=log
```

| EN | Show submodule changes‿as‿a log. |
|:---|:---|
| 読み | ショウ サブモジュー(ル) チェインジ‿ザ‿ザ ログ |
| つながり | changes‿as（子音＋母音） ／ as‿a（子音＋母音） |
| JP | サブモジュールの変化を、コミット一覧で表示する |

```
Submodule schema 970d12c..3d9c0f3:
  > feat: add User.email          ← このコミットが新しく入る
```

```bash
git diff --submodule=diff
```

| EN | Show the actual file changes‿inside the submodule. |
|:---|:---|
| 読み | ショウ ジ アクチュアル ファイ(ル) チェインジ‿ズィンサイ(ド) ザ サブモジュール |
| つながり | changes‿inside（子音＋母音） |
| JP | サブモジュールの中のファイル差分まで表示する（スキーマの差分そのもの） |

```diff
--- a/schema/schema.graphql
+++ b/schema/schema.graphql
+type User {
+  email: String
+}
```

### PR に入る内容を確認する（push 前の最終チェック）

```bash
git fetch && git log --oneline origin/main..HEAD
```

| EN | List the commits‿on my branch that‿aren't‿on main. |
|:---|:---|
| 読み | リス(ト) ザ カミッ‿ツォン マイ ブランチ ザ‿ラーン‿トン メイン |
| つながり | commits‿on（子音＋母音） ／ that‿aren't（t＋母音（t がラ行に近い音になる）） ／ aren't‿on（t＋母音（t がラ行に近い音になる）） |
| JP | main に無く、自分のブランチにだけあるコミットを一覧する |

```bash
git diff --stat origin/main...HEAD
```

| EN | Show what my branch changed since‿it branched‿off. |
|:---|:---|
| 読み | ショウ ワッ(ト) マイ ブランチ チェインジ(ド) スィン‿スィッ(ト) ブランチ‿トフ |
| つながり | since‿it（子音＋母音） ／ branched‿off（子音＋母音） |
| JP | 分岐してから自分のブランチで変えた内容を表示する（PR の差分と同じ） |

```bash
git diff --check
```

| EN | Check for whitespace‿errors. |
|:---|:---|
| 読み | チェック フォー ワイ(ト)スペイ‿セラーズ |
| つながり | whitespace‿errors（子音＋母音） |
| JP | 行末の空白などのミスを検出する |

### 原理: `..`（ドット 2 つ）と `...`（ドット 3 つ）の違い

```
        A───B───C  origin/main
         \
          D───E    HEAD（自分）
```

| 書き方 | `git log` で | `git diff` で |
|---|---|---|
| `origin/main..HEAD` | D, E（自分にだけあるコミット） | main の最新と自分の差（**main 側の変更も逆向きに混ざる**） |
| `origin/main...HEAD` | B, C, D, E（両方の差） | **分岐点 A から自分まで**の差 = PR の差分 |

覚え方: **コミット一覧は `..`、ファイルの差分は `...`**

---

## 3. サブモジュールでブランチを切って修正・コミット・プッシュ

### 図

```
 schema リポジトリ
 origin/main ──●──●  970d12c
                     \
                      ● 3d9c0f3   feat/user-email   ← ここで作業して push
```

### 手順

```bash
git -C schema fetch origin
```

| EN | Fetch the latest from‿origin‿in schema. |
|:---|:---|
| 読み | フェッチ ザ レイテス(ト) フロ‿モリジ‿ニン スキーマ |
| つながり | from‿origin（子音＋母音） ／ origin‿in（子音＋母音） |
| JP | schema の最新情報を取ってくる |

```bash
git -C schema switch -c feat/user-email --no-track origin/main
```

| EN | Create‿a new branch from‿origin main. |
|:---|:---|
| 読み | クリエイ‿ラ ニュー ブランチ フロ‿モリジン メイン |
| つながり | Create‿a（t＋母音（t がラ行に近い音になる）） ／ from‿origin（子音＋母音） |
| JP | schema の最新 main から新しいブランチを作って切り替える |

> `--no-track` を付けないと、追跡先が `origin/main` になります。その状態で `git push` すると main に push しようとするので、付けておきます。

スキーマを編集します（例: `schema/schema.graphql`）。

```bash
git -C schema diff
```

| EN | Check your changes. |
|:---|:---|
| 読み | チェッキョア チェインジズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変更内容を確認する |

```bash
git -C schema add schema.graphql
```

| EN | Stage the file. |
|:---|:---|
| 読み | ステイジ ザ ファイル |
| つながり | なし（単語ごとに区切って読む） |
| JP | ファイルをステージする（パスは schema の中から見た相対パス） |

```bash
git -C schema commit -m "feat: User に email を追加"
```

| EN | Commit‿it with‿a message. |
|:---|:---|
| 読み | カミッ‿ティッ(ト) ウィ‿ザ メッセージ |
| つながり | Commit‿it（t＋母音（t がラ行に近い音になる）） ／ with‿a（子音＋母音） |
| JP | メッセージを付けてコミットする |

```bash
git -C schema push -u origin feat/user-email
```

| EN | Push‿it‿and set‿up tracking. |
|:---|:---|
| 読み | プッ‿シッ‿タン(ド) セッ‿ラップ トラッキング |
| つながり | Push‿it（子音＋母音） ／ it‿and（t＋母音（t がラ行に近い音になる）） ／ set‿up（t＋母音（t がラ行に近い音になる）） |
| JP | push して、追跡先（upstream）を設定する |

この後、schema リポジトリで PR を作成します。

### 確認

```bash
git -C schema status -sb
```

| EN | Show the status‿in schema. |
|:---|:---|
| 読み | ショウ ザ ステイタ‿スィン スキーマ |
| つながり | status‿in（子音＋母音） |
| JP | schema の状態を表示する |

```
## feat/user-email...origin/feat/user-email     ← [ahead N] が無ければ push 済み ✓
```

```bash
git -C schema log --oneline -3
```

| EN | Show the last three commits. |
|:---|:---|
| 読み | ショウ ザ ラス(ト) スリー カミッツ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 直近 3 件のコミットを表示する |

### 原理: サブモジュールの中は普段「ブランチに乗っていない」

- `git submodule update` は、サブモジュールを**ブランチではなく特定のコミット**に合わせます。この状態を **detached HEAD**（ディタッチト・ヘッド）と呼びます
- そのままコミットすると、どのブランチにも属さないコミットになり、後から見失いやすくなります
- そのため、**修正する前に必ず `switch -c` でブランチを作ります**

```bash
git -C schema status | head -1
# HEAD detached at 970d12c     ← この表示が出たらブランチに乗っていない
```

---

## 4. バックエンドが指すサブモジュールのコミット ID を差し替える

### 図

```
 backend                         schema
 feat/user-email                 
   └ schema = 970d12c  ──差し替え──▶  3d9c0f3（③で push したコミット）
```

### 手順

③の直後なら、`schema` の中身はすでに push したコミットにあります。それを親に記録します。

```bash
git add schema
```

| EN | Record the new submodule commit. |
|:---|:---|
| 読み | リコー(ド) ザ ニュー サブモジュー(ル)カミッ(ト) |
| つながり | なし（単語ごとに区切って読む） |
| JP | サブモジュールの新しいコミット ID を、親のステージに記録する |

#### 別のコミットを指したい場合

先に schema 側を移動させます。

```bash
git -C schema fetch origin && git -C schema switch --detach <コミットID またはブランチ名>
```

| EN | Detach‿at the commit. |
|:---|:---|
| 読み | ディタッ‿チャッ(ト) ザ カミッ(ト) |
| つながり | Detach‿at（子音＋母音） |
| JP | 指定したコミットに移動する |

```bash
git diff --staged --submodule=log
```

| EN | Check what will be committed. |
|:---|:---|
| 読み | チェッ(ク) ワッウィル ビー カミティッド |
| つながり | なし（単語ごとに区切って読む） |
| JP | コミットされる内容を確認する |

```
Submodule schema 970d12c..3d9c0f3:
  > feat: add User.email          ← 想定したコミットになっているか
```

```bash
git commit -m "chore(schema): スキーマを $(git -C schema rev-parse --short HEAD) に更新"
```

| EN | Commit the submodule‿update. |
|:---|:---|
| 読み | カミッ(ト) ザ サブモジュー‿ラップデイ(ト) |
| つながり | submodule‿update（子音＋母音） |
| JP | サブモジュールの更新をコミットする（メッセージに新しいコミット ID が入る） |

```bash
git push
```

| EN | Push‿it. |
|:---|:---|
| 読み | プッ‿シッ(ト) |
| つながり | Push‿it（子音＋母音） |
| JP | push する |

### 確認

```bash
echo "記録: $(git rev-parse --short HEAD:schema)  push済み: $(git -C schema rev-parse --short origin/feat/user-email)"
```

| EN | Make sure the recorded commit‿is the pushed one. |
|:---|:---|
| 読み | メイ(ク) シュア ザ リコーディッ(ド) カミッ‿ティズ ザ プッシュ(ト) ワン |
| つながり | commit‿is（t＋母音（t がラ行に近い音になる）） |
| JP | 記録したコミットが push したものと同じか確かめる |

```bash
git -C schema branch -r --contains HEAD
```

| EN | Which remote branches contain this commit? |
|:---|:---|
| 読み | ウィッチ リモー(ト)ブランチズ コンテイン ディス カミッ(ト) |
| つながり | なし（単語ごとに区切って読む） |
| JP | このコミットを含むリモートブランチを表示する（何も出なければ未 push ✗） |

### 原理: schema 側で squash merge されたら、もう一度差し替える

```
 schema
 feat/user-email ──● 3d9c0f3
 main ──●──●──────────● 42943c5   ← squash merge で「中身は同じ・ID は別」のコミットができる
```

- schema の PR が **squash merge** されると、main には**別の ID のコミット**が作られます
- PR 用のブランチが削除されると、`3d9c0f3` は誰も取得できなくなります
- そのため、**schema の PR がマージされたら、backend の記録を main 側のコミットに差し替えます**

```bash
git -C schema fetch origin && git -C schema switch --detach origin/main
git add schema
git commit -m "chore(schema): マージ後の main に差し替え"
```

```bash
git -C schema merge-base --is-ancestor HEAD origin/main && echo OK
```

| EN | Is this commit‿on schema's main? |
|:---|:---|
| 読み | イズ ディス カミッ‿トン スキーマズ メイン |
| つながり | commit‿on（t＋母音（t がラ行に近い音になる）） |
| JP | このコミットが schema の main に含まれているか（OK と出れば ✓） |

#### ヒント: push し忘れの防止（一度だけ実行）

```bash
git config --global push.recurseSubmodules check
```

サブモジュールの未 push のコミットを指したまま backend を push しようとすると、拒否してくれます。

---

## 5. サブモジュールのコンフリクト対応

### 起きる場面

自分のブランチでも main でも、それぞれ schema のコミット ID を変えていた場合に起きます。

```
            schema = 8d524e8（main 側で更新）
 main ──●──●
         \
          ●  feat/user-email
            schema = 3d9c0f3（自分で更新）

 → git merge origin/main / git rebase origin/main で衝突
```

### ① 衝突していることを確認する

```bash
git status -sb
```

| EN | Check the status. |
|:---|:---|
| 読み | チェッ(ク) ザ ステイタス |
| つながり | なし（単語ごとに区切って読む） |
| JP | 状態を確認する |

```
UU schema        ← UU = 両方で変更（both modified）
```

### ② 3 つの候補を見る

```bash
git ls-files -u -- schema
```

| EN | List the unmerged‿entries for schema. |
|:---|:---|
| 読み | リス(ト) ジ アンマージ‿デントリーズ フォー スキーマ |
| つながり | unmerged‿entries（子音＋母音） |
| JP | schema について、衝突している 3 つのコミットを表示する |

```
160000 970d12c... 1   schema     ← 1 = 共通の祖先（base）
160000 3d9c0f3... 2   schema     ← 2 = ours
160000 8d524e8... 3   schema     ← 3 = theirs
```

それぞれの中身を確認する:

```bash
git -C schema fetch origin
for s in 1 2 3; do echo "[$s] $(git -C schema log --oneline -1 $(git ls-files -u -- schema | awk -v s=$s '$3==s{print $2}'))"; done
```

| EN | Show each candidate commit. |
|:---|:---|
| 読み | ショウィーチ キャンディデイ(ト)カミッ(ト) |
| つながり | なし（単語ごとに区切って読む） |
| JP | 3 つの候補コミットの内容を 1 行ずつ表示する |

```
[1] 970d12c feat: users query
[2] 3d9c0f3 feat: add User.email
[3] 8d524e8 feat: posts
```

### ③ 使うコミットを決めて、schema をそこへ移動する

| 状況 | 選ぶコミット | コマンド |
|---|---|---|
| **自分の schema の変更がすでに schema の main にマージ済み**（いちばん多い） | schema の最新 main（両方の変更を含む） | `git -C schema switch --detach origin/main` |
| 相手側（main）のスキーマだけでよい | 相手側 | 下の「相手側を選ぶ」 |
| 自分のスキーマだけでよい | 自分側 | 下の「自分側を選ぶ」 |
| 両方必要だが、まだどこにも合わさっていない | schema 側でマージしたコミット | 先に schema で両方を合わせて push → それを選ぶ |

いちばん多いケース（schema の最新 main を使う）:

```bash
git -C schema switch --detach origin/main
```

| EN | Move schema to the latest main. |
|:---|:---|
| 読み | ムーヴ スキーマ トゥ ザ レイテス(ト)メイン |
| つながり | なし（単語ごとに区切って読む） |
| JP | schema を最新の main に移動する |

相手側を選ぶ（**merge 中なら 3、rebase 中なら 2**）:

```bash
git -C schema switch --detach $(git ls-files -u -- schema | awk '$3==3{print $2}')
```

| EN | Take their version. |
|:---|:---|
| 読み | テイ(ク) ゼア ヴァージョン |
| つながり | なし（単語ごとに区切って読む） |
| JP | 相手側のコミットを使う |

自分側を選ぶ（**merge 中なら 2、rebase 中なら 3**）:

```bash
git -C schema switch --detach $(git ls-files -u -- schema | awk '$3==2{print $2}')
```

| EN | Keep‿our version. |
|:---|:---|
| 読み | キー‿パワー ヴァージョン |
| つながり | Keep‿our（子音＋母音） |
| JP | 自分側のコミットを使う |

### ④ 解決を記録して続行する

```bash
git add schema
```

| EN | Mark‿it‿as resolved. |
|:---|:---|
| 読み | マー‿キッ‿タズ リゾルヴド |
| つながり | Mark‿it（子音＋母音） ／ it‿as（t＋母音（t がラ行に近い音になる）） |
| JP | 解決済みとして記録する |

ビルドとテストで、生成コードが合っているか確かめます。

```bash
cargo build && cargo test
```

merge の場合:

```bash
git commit --no-edit
```

| EN | Commit the merge. |
|:---|:---|
| 読み | カミッ(ト) ザ マージ |
| つながり | なし（単語ごとに区切って読む） |
| JP | マージコミットを作る |

rebase の場合:

```bash
git rebase --continue
```

| EN | Continue the rebase. |
|:---|:---|
| 読み | コンティニュー ザ リベイス |
| つながり | なし（単語ごとに区切って読む） |
| JP | リベースを続ける |

### やめたいとき

```bash
git merge --abort
```

| EN | Abort the merge. |
|:---|:---|
| 読み | アボー(ト) ザ マージ |
| つながり | なし（単語ごとに区切って読む） |
| JP | マージを中止して元に戻す |

```bash
git rebase --abort
```

| EN | Abort the rebase. |
|:---|:---|
| 読み | アボー(ト) ザ リベイス |
| つながり | なし（単語ごとに区切って読む） |
| JP | リベースを中止して元に戻す |

### 確認

```bash
git status -sb && git submodule status
```

| EN | Check that nothing‿is left‿unresolved. |
|:---|:---|
| 読み | チェッ(ク) ザッ(ト) ナッスィン‿ギズ レフ‿タンリゾルヴド |
| つながり | nothing‿is（子音＋母音） ／ left‿unresolved（t＋母音（t がラ行に近い音になる）） |
| JP | 未解決のものが残っていないか確認する |

```
## feat/user-email
 42943c5... schema (remotes/origin/HEAD)     ← UU も + も無ければ OK ✓
```

```bash
git -C schema merge-base --is-ancestor HEAD origin/main && echo OK
```

| EN | Is the chosen commit‿on schema's main? |
|:---|:---|
| 読み | イズ ザ チョウズン カミッ‿トン スキーマズ メイン |
| つながり | commit‿on（t＋母音（t がラ行に近い音になる）） |
| JP | 選んだコミットが schema の main に含まれているか確認する（OK と出れば ✓） |

### 原理 1: なぜ Git は自動で解決できないのか

- 普通のファイルは行単位で混ぜられますが、gitlink は**コミット ID という 1 つの値**です
- 「`3d9c0f3` と `8d524e8` の中間」は存在しないので、**人がどちらか（または両方を含むコミット）を選ぶ**しかありません
- Git も衝突時に `go to submodule (schema), and either merge commit 8d524e8 or update to an existing commit which has merged those changes` と案内します（「schema に移動して、相手のコミットをマージするか、両方を含む既存のコミットに移動せよ」）

### 原理 2: rebase 中は ours / theirs が逆になる

```
 merge:   いま自分のブランチにいる  → 相手（main）を取り込む
          ours = 自分（2）           theirs = main（3）

 rebase:  いったん main に移動して   → 自分のコミットを 1 つずつ積み直す
          ours = main（2）           theirs = 自分（3）
```

| | 2（ours） | 3（theirs） |
|---|---|---|
| `git merge origin/main` 中 | **自分** | main |
| `git rebase origin/main` 中 | main | **自分** |

迷ったら、②の `for` ループでコミットメッセージを見て判断するのが確実です。

---

## まとめ: 1 枚で見る

```bash
# ① 最新にしてサブモジュールを揃える
git switch main && git pull && git submodule update --init --recursive
git submodule status                                  # 先頭が空白なら OK

# ② 差分を確認
git status -sb
git diff --submodule=log                              # schema の変化（コミット一覧）
git diff --staged                                     # 次のコミットに入る内容
git fetch && git diff --stat origin/main...HEAD       # PR の差分

# ③ schema でブランチを切って修正・push
git -C schema fetch origin
git -C schema switch -c feat/xxx --no-track origin/main
git -C schema add . && git -C schema commit -m "feat: ..."
git -C schema push -u origin feat/xxx

# ④ backend の記録を差し替え
git add schema
git diff --staged --submodule=log
git commit -m "chore(schema): スキーマを $(git -C schema rev-parse --short HEAD) に更新"
git push

# ⑤ schema が衝突したら
git ls-files -u -- schema                             # 1=base 2=ours 3=theirs
git -C schema fetch origin && git -C schema switch --detach origin/main   # 使うコミットへ
git add schema
cargo build && cargo test
git commit --no-edit        # merge のとき ／ git rebase --continue  # rebase のとき
```

