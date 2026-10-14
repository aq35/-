# 英語の学習 5. 今回の修正に関連する箇所を調べる

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 5 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Find everything related to this change and list it. |
|:---|:---|
| 読み | ファインド エヴリスィング リレイティッ(ド) トゥ ディス チェインジ アン(ド) リスティッ(ト) |
| JP | 今回の修正に関連するものをすべて探して、一覧にしてください。 |

## [This change]（今回の修正）

読み: ディス チェインジ

| EN | If the change is already made, use "the changes on the current branch = git diff origin/main...HEAD". |
|:---|:---|
| 読み | イフ ザ チェインジ イズ オールレディ メイド、ユーズ "ザ チェインジズ オン ザ カレン(ト) ブランチ イコール ギッ(ト) ディフ オリジン メイン ドッ(ト) ドッ(ト) ドッ(ト) ヘッド" |
| JP | すでに変更してあるときは、「今のブランチの変更 = git diff origin/main...HEAD」を対象にしてください。 |

## [Meaning of the words]（言葉の意味）

読み: ミーニング オヴ ザ ワーズ

| EN | "Attribute" means a data item (a field of a struct). |
|:---|:---|
| 読み | "アトリビュー(ト)" ミーンズ ア デイタ アイテム（ア フィールド オヴ ア ストラクト） |
| JP | 「属性」は、データの項目（構造体のフィールド）の意味です。 |

| EN | It does not mean a language attribute (such as Rust's #[...]) or a tag (such as Go's struct tags). |
|:---|:---|
| 読み | イッ(ト) ダズ ノッ(ト) ミーン ア ラングイッジ アトリビュー(ト)（サッチ アズ ラスツ）オア ア タグ（サッチ アズ ゴーズ ストラクト タグズ） |
| JP | 言語の属性（Rust の #[...] など）や、タグ（Go の構造体タグなど）の意味ではありません。 |

## [What to look for]（探すもの）

読み: ワッ(ト) トゥ ルック フォー

| EN | Places that use the same type, function, or constant (callers, usages) |
|:---|:---|
| 読み | プレイスィズ ザッ(ト) ユーズ ザ セイム タイプ、ファンクション、オア コンスタン(ト)（コーラーズ、ユースィジズ） |
| JP | 同じ型・関数・定数を使っている箇所（呼び出し元、使用箇所） |

| EN | Missed field additions |
|:---|:---|
| 読み | ミスト フィールド アディションズ |
| JP | フィールド追加の対応漏れ |

| EN | When a field is added to a struct, the same field must also be added to the other implementations that use the same struct. |
|:---|:---|
| 読み | ウェン ア フィールド イズ アディッド トゥ ア ストラクト、ザ セイム フィールド マスト オールソウ ビー アディッド トゥ ジ アザー インプリメンテイションズ ザッ(ト) ユーズ ザ セイム ストラクト |
| JP | 構造体にフィールドを追加するときは、同じ構造体を使っている別の実装にも、同じフィールドを追加する必要があります。 |

| EN | Look in these two ways: |
|:---|:---|
| 読み | ルック イン ズィーズ トゥー ウェイズ |
| JP | 次の 2 通りで探してください: |

| EN | Implementations that use the same struct name |
|:---|:---|
| 読み | インプリメンテイションズ ザッ(ト) ユーズ ザ セイム ストラクト ネイム |
| JP | 同じ構造体名を使っている実装 |

| EN | Types whose name differs but whose fields are similar |
|:---|:---|
| 読み | タイプス フーズ ネイム ディファーズ バッ(ト) フーズ フィールズ アー スィミラー |
| JP | 名前は違うが、フィールドが似ている型 |

| EN | Use matching or similar field names as clues, including differences between snake_case and camelCase. |
|:---|:---|
| 読み | ユーズ マッチン オア スィミラー フィールド ネイムズ アズ クルーズ、インクルーディン ディファレンセズ ビトゥィーン スネイク ケイス アン(ド) キャメル ケイス |
| JP | 一致する、または似たフィールド名を手がかりにしてください（snake_case と camelCase の違いも含めて）。 |

| EN | For each type you find, decide whether the field must be added, and give the reason. |
|:---|:---|
| 読み | フォー イーチ タイプ ユー ファインド、ディサイド ウェザー ザ フィールド マスト ビー アディッド、アン(ド) ギヴ ザ リーズン |
| JP | 見つけた型ごとに、フィールドを追加する必要があるかを判断し、理由を書いてください。 |

| EN | Mark it "needs confirmation" if you cannot decide. |
|:---|:---|
| 読み | マーク イッ(ト) "ニーズ コンファメイション" イフ ユー キャナッ(ト) ディサイド |
| JP | 判断できないときは、「要確認」としてください。 |

| EN | Settings attached to the item (tags / attributes such as JSON names, serialization settings, validation, default values) |
|:---|:---|
| 読み | セッティングズ アタッチ(ト) トゥ ジ アイテム（タグズ / アトリビューツ サッチ アズ ジェイソン ネイムズ、スィアリゼイション セッティングズ、ヴァリデイション、ディフォールト ヴァリューズ） |
| JP | 項目に付随する設定（JSON 名などのタグ・属性、シリアライズの設定、検証、初期値） |

| EN | Conversion code (type conversion functions, mappers, hand-written copying code) |
|:---|:---|
| 読み | コンヴァージョン コウド（タイプ コンヴァージョン ファンクションズ、マッパーズ、ハンドリトゥン コピーイン コウド） |
| JP | 変換処理（型の変換関数、マッパー、手書きの詰め替え処理） |

| EN | The GraphQL schema (schema/), DB migrations, tests, documents, configuration files |
|:---|:---|
| 読み | ザ グラフキューエル スキーマ（スキーマ）、ディービー マイグレイションズ、テスツ、ドキュメンツ、コンフィギュレイション ファイルズ |
| JP | GraphQL のスキーマ（schema/）、DB のマイグレーション、テスト、文書、設定ファイル |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | For items found as "similar", write why you judged them similar (which field names matched). |
|:---|:---|
| 読み | フォー アイテムズ ファウンド アズ "スィミラー"、ライ(ト) ワイ ユー ジャッジド ゼム スィミラー（ウィッチ フィールド ネイムズ マッチト） |
| JP | 「類似」として見つけたものには、なぜ似ていると判断したか（どのフィールド名が一致したか）を書いてください。 |

| EN | At the end, report what you checked in places that are hard to find by search (reflection, macros, generated code, fields referenced by string). |
|:---|:---|
| 読み | アッ(ト) ジ エンド、リポー(ト) ワッ(ト) ユー チェックト イン プレイスィズ ザッ(ト) アー ハー(ド) トゥ ファインド バイ サーチ（リフレクション、マクロウズ、ジェネレイティッ(ド) コウド、フィールズ リファレンスト バイ ストリング） |
| JP | 最後に、検索では見つけにくい場所（リフレクション、マクロ、生成コード、文字列で指定されたフィールド）で何を確認したかを報告してください。 |

---

## この指示文の難しい単語（19 語）

[attach](words.md#attach) ／ [attribute](words.md#attribute) ／ [caller](words.md#caller) ／ [clue](words.md#clue) ／ [conversion](words.md#conversion) ／ [default value](words.md#default-value) ／ [generated code](words.md#generated-code) ／ [implementation](words.md#implementation) ／ [macro](words.md#macro) ／ [mapper](words.md#mapper) ／ [mark](words.md#mark) ／ [missed](words.md#missed) ／ [reflection](words.md#reflection) ／ [related](words.md#related) ／ [serialization](words.md#serialization) ／ [similar](words.md#similar) ／ [tag](words.md#tag) ／ [validation](words.md#validation) ／ [whose](words.md#whose)
