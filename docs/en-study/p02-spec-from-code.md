# 英語の学習 2. 実装から仕様を調べる

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 2 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Read the implementation (code) and‿investigate the spec‿of &lt;target feature / module&gt;. |
|:---|:---|
| 読み | リー(ド) ジ インプリメンテイション（コウド）アン‿ディンヴェスティゲイ(ト) ザ スペッ‿コヴ &lt;ターゲッ(ト) フィーチャー / モジュール&gt; |
| つながり | and‿investigate（子音＋母音） ／ spec‿of（子音＋母音） |
| JP | 実装（コード）を読んで、&lt;対象の機能・モジュール&gt; の仕様を調べてください。 |

| EN | Write‿it‿in Markdown. |
|:---|:---|
| 読み | ライ‿リ‿リン マークダウン |
| つながり | Write‿it（t＋母音（t がラ行に近い音になる）） ／ it‿in（t＋母音（t がラ行に近い音になる）） |
| JP | Markdown で書いてください。 |

## [Premise]（前提）

読み: プレミス ／ つながり: なし（単語ごとに区切って読む）

| EN | The source‿of truth for the spec‿is "what the code‿does now". |
|:---|:---|
| 読み | ザ ソー‿ソヴ トゥルース フォー ザ スペッ‿キズ "ワッ(ト) ザ コウ‿ダズ ナウ" |
| つながり | source‿of（子音＋母音） ／ spec‿is（子音＋母音） ／ code‿does（同じ・似た子音が続く（前の音は言わない）） |
| JP | 仕様の正（正しさの基準）は「今のコードの動き」です。 |

| EN | Do not use design documents‿or PR descriptions for this task. |
|:---|:---|
| 読み | ドゥー ナッ(ト) ユーズ ディザイン ドキュメン‿ツォア ピーアール ディスクリプションズ フォー ディス タスク |
| つながり | documents‿or（子音＋母音） |
| JP | この依頼では、設計書や PR の説明は使わないでください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ナッ(ト) マディファイ エニィ コウド |
| つながり | なし（単語ごとに区切って読む） |
| JP | コードは変更しないでください。 |

## [What‿to investigate]（調べる内容）

読み: ワッ‿トゥ インヴェスティゲイ(ト) ／ つながり: What‿to（同じ・似た子音が続く（前の音は言わない））

| EN | Purpose (what the feature‿is for, as far‿as the code shows) |
|:---|:---|
| 読み | パーパス（ワッ(ト) ザ フィーチャ‿リズ フォー、アズ ファ‿ラズ ザ コウド ショウズ） |
| つながり | feature‿is（r＋母音） ／ far‿as（r＋母音） |
| JP | 目的（機能が何のためにあるか。コードから分かる範囲で） |

| EN | Input (arguments, requests, types, constraints, default values) |
|:---|:---|
| 読み | インプッ(ト)（アーギュメンツ、リクエスツ、タイプス、コンストレインツ、ディフォールト ヴァリューズ） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 入力（引数、リクエスト、型、制約、初期値） |

| EN | Output (return values, responses, types) |
|:---|:---|
| 読み | アウトプッ(ト)（リターン ヴァリューズ、リスポンセズ、タイプス） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 出力（戻り値、レスポンス、型） |

| EN | Flow (in call‿order; name the functions‿and files) |
|:---|:---|
| 読み | フロウ（イン コー‿ローダー；ネイム ザ ファンクション‿ザン(ド) ファイルズ） |
| つながり | call‿order（子音＋母音） ／ functions‿and（子音＋母音） |
| JP | 処理の流れ（呼び出し順。関数名とファイルを書く） |

| EN | Branches‿and‿errors (under which condition which‿error‿is returned) |
|:---|:---|
| 読み | ブランチ‿ザン‿デラーズ（アンダー ウィッチ コンディション ウィッ‿チェラ‿リズ リターンド） |
| つながり | Branches‿and（子音＋母音） ／ and‿errors（子音＋母音） ／ which‿error（子音＋母音） ／ error‿is（r＋母音） |
| JP | 分岐とエラー（どの条件で、どのエラーが返るか） |

| EN | Side‿effects (DB updates, external‿API calls, logs, cache) |
|:---|:---|
| 読み | サイ‿ディフェクツ（ディービー アップデイツ、エクスターナ‿レイピーアイ コールズ、ログズ、キャッシュ） |
| つながり | Side‿effects（子音＋母音） ／ external‿API（子音＋母音） |
| JP | 副作用（DB の更新、外部 API の呼び出し、ログ、キャッシュ） |

| EN | Implicit constraints (authorization, ordering, upper limits, timeouts, retries) |
|:---|:---|
| 読み | インプリスィッ(ト) コンストレインツ（オーソライゼイション、オーダリング、アッパー リミッツ、タイムアウツ、リトライズ） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 暗黙の制約（認可、並び順、上限、タイムアウト、リトライ） |

## [How to write]（書き方）

読み: ハウ トゥ ライ(ト) ／ つながり: なし（単語ごとに区切って読む）

| EN | Attach‿evidence to every item: file path‿and line‿number. |
|:---|:---|
| 読み | アタッ‿チェヴィデンス トゥ エヴリ アイテム：ファイル パ‿サン(ド) ライ‿ナンバー |
| つながり | Attach‿evidence（子音＋母音） ／ path‿and（子音＋母音） ／ line‿number（同じ・似た子音が続く（前の音は言わない）） |
| JP | すべての項目に根拠を付けてください: ファイルのパスと行番号。 |

| EN | Write what the code shows‿as "fact". |
|:---|:---|
| 読み | ライ(ト) ワッ(ト) ザ コウド ショウ‿ザズ "ファクト" |
| つながり | shows‿as（子音＋母音） |
| JP | コードが示していることは「事実」と書いてください。 |

| EN | Write what the code cannot‿tell you (intent, background) as "unknown". |
|:---|:---|
| 読み | ライ(ト) ワッ(ト) ザ コウド キャナッ‿テル ユー（インテン(ト)、バックグラウンド）アズ "アンノウン" |
| つながり | cannot‿tell（同じ・似た子音が続く（前の音は言わない）） |
| JP | コードからは分からないこと（意図、背景）は「不明」と書いてください。 |

| EN | Do not fill gaps with guesses. |
|:---|:---|
| 読み | ドゥー ナッ(ト) フィル ギャップス ウィズ ゲッセズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 空白を推測で埋めないでください。 |

| EN | Put suspicious points (possible bugs, comments that‿disagree with the code) in‿a separate section, "Points‿of concern", apart from the spec. |
|:---|:---|
| 読み | プッ(ト) サスピシャス ポインツ（ポッスィブル バグズ、コメンツ ザッ‿ディスアグリー ウィズ ザ コウド）イ‿ナ セパレッ(ト) セクション、"ポイン‿ツォヴ コンサーン"、アパー(ト) フロム ザ スペック |
| つながり | that‿disagree（同じ・似た子音が続く（前の音は言わない）） ／ in‿a（子音＋母音） ／ Points‿of（子音＋母音） |
| JP | 怪しい点（バグの疑い、コードと食い違うコメント）は、仕様とは別の「気になった点」の節に書いてください。 |

---

## この指示文の難しい単語（19 語）

[attach](words.md#attach) ／ [authorization](words.md#authorization) ／ [branch](words.md#branch) ／ [concern](words.md#concern) ／ [constraint](words.md#constraint) ／ [default value](words.md#default-value) ／ [evidence](words.md#evidence) ／ [guess](words.md#guess) ／ [implementation](words.md#implementation) ／ [implicit](words.md#implicit) ／ [intent](words.md#intent) ／ [investigate](words.md#investigate) ／ [premise](words.md#premise) ／ [purpose](words.md#purpose) ／ [retry](words.md#retry) ／ [side effect](words.md#side-effect) ／ [source of truth](words.md#source-of-truth) ／ [suspicious](words.md#suspicious) ／ [timeout](words.md#timeout)
