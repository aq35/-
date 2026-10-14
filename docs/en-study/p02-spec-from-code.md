# 英語の学習 2. 実装から仕様を調べる

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 2 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Read the implementation (code) and investigate the spec of &lt;target feature / module&gt;. |
|:---|:---|
| 読み | リード ジ インプリメンテイション（コウド）アン インヴェスティゲイ(ト) ザ スペック オヴ（ターゲッ(ト) フィーチャー / モジュール） |
| JP | 実装（コード）を読んで、&lt;対象の機能・モジュール&gt; の仕様を調べてください。 |

| EN | Write it in Markdown. |
|:---|:---|
| 読み | ライティッ(ト) イン マークダウン |
| JP | Markdown で書いてください。 |

## [Premise]（前提）

読み: プレミス

| EN | The source of truth for the spec is "what the code does now". |
|:---|:---|
| 読み | ザ ソース オヴ トゥルース フォー ザ スペック イズ "ワッ(ト) ザ コウド ダズ ナウ" |
| JP | 仕様の正（正しさの基準）は「今のコードの動き」です。 |

| EN | Do not use design documents or PR descriptions for this task. |
|:---|:---|
| 読み | ドゥー ノッ(ト) ユーズ ディザイン ドキュメンツ オア ピーアール ディスクリプションズ フォー ディス タスク |
| JP | この依頼では、設計書や PR の説明は使わないでください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ノッ(ト) マディファイ エニィ コウド |
| JP | コードは変更しないでください。 |

## [What to investigate]（調べる内容）

読み: ワッ(ト) トゥ インヴェスティゲイ(ト)

| EN | Purpose (what the feature is for, as far as the code shows) |
|:---|:---|
| 読み | パーパス（ワッ(ト) ザ フィーチャー イズ フォー、アズ ファー アズ ザ コウド ショウズ） |
| JP | 目的（機能が何のためにあるか。コードから分かる範囲で） |

| EN | Input (arguments, requests, types, constraints, default values) |
|:---|:---|
| 読み | インプッ(ト)（アーギュメンツ、リクエスツ、タイプス、コンストレインツ、ディフォールト ヴァリューズ） |
| JP | 入力（引数、リクエスト、型、制約、初期値） |

| EN | Output (return values, responses, types) |
|:---|:---|
| 読み | アウトプッ(ト)（リターン ヴァリューズ、リスポンセズ、タイプス） |
| JP | 出力（戻り値、レスポンス、型） |

| EN | Flow (in call order; name the functions and files) |
|:---|:---|
| 読み | フロウ（イン コール オーダー；ネイム ザ ファンクションズ アン(ド) ファイルズ） |
| JP | 処理の流れ（呼び出し順。関数名とファイルを書く） |

| EN | Branches and errors (under which condition which error is returned) |
|:---|:---|
| 読み | ブランチズ アン(ド) エラーズ（アンダー ウィッチ コンディション ウィッチ エラー イズ リターンド） |
| JP | 分岐とエラー（どの条件で、どのエラーが返るか） |

| EN | Side effects (DB updates, external API calls, logs, cache) |
|:---|:---|
| 読み | サイド イフェクツ（ディービー アップデイツ、エクスターナル エーピーアイ コールズ、ログズ、キャッシュ） |
| JP | 副作用（DB の更新、外部 API の呼び出し、ログ、キャッシュ） |

| EN | Implicit constraints (authorization, ordering, upper limits, timeouts, retries) |
|:---|:---|
| 読み | インプリスィッ(ト) コンストレインツ（オーソライゼイション、オーダリング、アッパー リミッツ、タイムアウツ、リトライズ） |
| JP | 暗黙の制約（認可、並び順、上限、タイムアウト、リトライ） |

## [How to write]（書き方）

読み: ハウ トゥ ライ(ト)

| EN | Attach evidence to every item: file path and line number. |
|:---|:---|
| 読み | アタッチ エヴィデンス トゥ エヴリ アイテム：ファイル パス アン(ド) ライン ナンバー |
| JP | すべての項目に根拠を付けてください: ファイルのパスと行番号。 |

| EN | Write what the code shows as "fact". |
|:---|:---|
| 読み | ライ(ト) ワッ(ト) ザ コウド ショウズ アズ "ファクト" |
| JP | コードが示していることは「事実」と書いてください。 |

| EN | Write what the code cannot tell you (intent, background) as "unknown". |
|:---|:---|
| 読み | ライ(ト) ワッ(ト) ザ コウド キャナッ(ト) テル ユー（インテン(ト)、バックグラウンド）アズ "アンノウン" |
| JP | コードからは分からないこと（意図、背景）は「不明」と書いてください。 |

| EN | Do not fill gaps with guesses. |
|:---|:---|
| 読み | ドゥー ノッ(ト) フィル ギャップス ウィズ ゲッセズ |
| JP | 空白を推測で埋めないでください。 |

| EN | Put suspicious points (possible bugs, comments that disagree with the code) in a separate section, "Points of concern", apart from the spec. |
|:---|:---|
| 読み | プッ(ト) サスピシャス ポインツ（ポッスィブル バグズ、コメンツ ザッ(ト) ディスアグリー ウィズ ザ コウド）イン ア セパレッ(ト) セクション、"ポインツ オヴ コンサーン"、アパー(ト) フロム ザ スペック |
| JP | 怪しい点（バグの疑い、コードと食い違うコメント）は、仕様とは別の「気になった点」の節に書いてください。 |

---

## この指示文の難しい単語（19 語）

[attach](words.md#attach) ／ [authorization](words.md#authorization) ／ [branch](words.md#branch) ／ [concern](words.md#concern) ／ [constraint](words.md#constraint) ／ [default value](words.md#default-value) ／ [evidence](words.md#evidence) ／ [guess](words.md#guess) ／ [implementation](words.md#implementation) ／ [implicit](words.md#implicit) ／ [intent](words.md#intent) ／ [investigate](words.md#investigate) ／ [premise](words.md#premise) ／ [purpose](words.md#purpose) ／ [retry](words.md#retry) ／ [side effect](words.md#side-effect) ／ [source of truth](words.md#source-of-truth) ／ [suspicious](words.md#suspicious) ／ [timeout](words.md#timeout)
