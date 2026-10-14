# 英語の学習 5. 今回の修正に関連する箇所を調べる

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 5 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Find‿everything related‿to this change‿and list‿it. |
|:---|:---|
| 読み | ファイン‿デヴリスィング リレイティッ‿トゥ ディス チェイン‿ジャン(ド) リス‿ティッ(ト) |
| つながり | Find‿everything（子音＋母音） ／ related‿to（同じ・似た子音が続く（前の音は言わない）） ／ change‿and（子音＋母音） ／ list‿it（t＋母音（t がラ行に近い音になる）） |
| JP | 今回の修正に関連するものをすべて探して、一覧にしてください。 |

## [This change]（今回の修正）

読み: ディス チェインジ ／ つながり: なし（単語ごとに区切って読む）

| EN | If the change‿is‿already made, use "the changes‿on the current branch = git‿diff‿origin/main...HEAD". |
|:---|:---|
| 読み | イフ ザ チェインジ‿ズィ‿ゾールレディ メイド、ユーズ "ザ チェインジ‿ゾン ザ カレン(ト) ブランチ イコール ギッ‿ディ‿フォリジン メイン ドッ(ト) ドッ(ト) ドッ(ト) ヘッド" |
| つながり | change‿is（子音＋母音） ／ is‿already（子音＋母音） ／ changes‿on（子音＋母音） ／ git‿diff（同じ・似た子音が続く（前の音は言わない）） ／ diff‿origin（子音＋母音） |
| JP | すでに変更してあるときは、「今のブランチの変更 = git diff origin/main...HEAD」を対象にしてください。 |

## [Meaning‿of the words]（言葉の意味）

読み: ミーニン‿ゴヴ ザ ワーズ ／ つながり: Meaning‿of（子音＋母音）

| EN | "Attribute" means‿a data item (a field‿of‿a struct). |
|:---|:---|
| 読み | "アトリビュー(ト)" ミーン‿ザ デイタ アイテム（ア フィール‿ド‿ヴァ ストラクト） |
| つながり | means‿a（子音＋母音） ／ field‿of（子音＋母音） ／ of‿a（子音＋母音） |
| JP | 「属性」は、データの項目（構造体のフィールド）の意味です。 |

| EN | It‿does not mean‿a language‿attribute (such‿as Rust's #[...]) or‿a tag (such‿as Go's‿struct‿tags). |
|:---|:---|
| 読み | イッ‿ダズ ナッ(ト) ミー‿ナ ラングイッ‿ジャトリビュー(ト)（サッ‿チャズ ラスツ）オ‿ラ タグ（サッ‿チャズ ゴウ‿ズトラク‿タグズ） |
| つながり | It‿does（同じ・似た子音が続く（前の音は言わない）） ／ mean‿a（子音＋母音） ／ language‿attribute（子音＋母音） ／ such‿as（子音＋母音） ／ or‿a（r＋母音） ／ such‿as（子音＋母音） ／ Go's‿struct（同じ・似た子音が続く（前の音は言わない）） ／ struct‿tags（同じ・似た子音が続く（前の音は言わない）） |
| JP | 言語の属性（Rust の #[...] など）や、タグ（Go の構造体タグなど）の意味ではありません。 |

## [What‿to look for]（探すもの）

読み: ワッ‿トゥ ルック フォー ／ つながり: What‿to（同じ・似た子音が続く（前の音は言わない））

| EN | Places that use the same type, function, or constant (callers, usages) |
|:---|:---|
| 読み | プレイスィズ ザッ(ト) ユーズ ザ セイム タイプ、ファンクション、オア コンスタン(ト)（コーラーズ、ユースィジズ） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 同じ型・関数・定数を使っている箇所（呼び出し元、使用箇所） |

| EN | Missed field‿additions |
|:---|:---|
| 読み | ミス(ト) フィール‿ダディションズ |
| つながり | field‿additions（子音＋母音） |
| JP | フィールド追加の対応漏れ |

| EN | When‿a field‿is‿added‿to a struct, the same field must‿also be added‿to the other‿implementations that use the same struct. |
|:---|:---|
| 読み | ウェ‿ナ フィール‿ディ‿ザディッ‿トゥ ア ストラクト、ザ セイム フィールド マス‿トールソウ ビー アディッ‿トゥ ジ アザ‿リンプリメンテイションズ ザッ(ト) ユーズ ザ セイム ストラクト |
| つながり | When‿a（子音＋母音） ／ field‿is（子音＋母音） ／ is‿added（子音＋母音） ／ added‿to（同じ・似た子音が続く（前の音は言わない）） ／ must‿also（t＋母音（t がラ行に近い音になる）） ／ added‿to（同じ・似た子音が続く（前の音は言わない）） ／ other‿implementations（r＋母音） |
| JP | 構造体にフィールドを追加するときは、同じ構造体を使っている別の実装にも、同じフィールドを追加する必要があります。 |

| EN | Look‿in these two ways: |
|:---|:---|
| 読み | ル‿キン ズィーズ トゥー ウェイズ |
| つながり | Look‿in（子音＋母音） |
| JP | 次の 2 通りで探してください: |

| EN | Implementations that use the same struct name |
|:---|:---|
| 読み | インプリメンテイションズ ザッ(ト) ユーズ ザ セイム ストラクト ネイム |
| つながり | なし（単語ごとに区切って読む） |
| JP | 同じ構造体名を使っている実装 |

| EN | Types whose name differs but whose fields‿are similar |
|:---|:---|
| 読み | タイプス フーズ ネイム ディファーズ バッ(ト) フーズ フィール‿ザー スィミラー |
| つながり | fields‿are（子音＋母音） |
| JP | 名前は違うが、フィールドが似ている型 |

| EN | Use matching‿or similar field names‿as clues, including differences between snake_case‿and camelCase. |
|:---|:---|
| 読み | ユーズ マッチン‿ゴア スィミラー フィールド ネイム‿ザズ クルーズ、インクルーディン ディファレンセズ ビトゥィーン スネイクケイ‿サン(ド) キャメルケイス |
| つながり | matching‿or（子音＋母音） ／ names‿as（子音＋母音） ／ snake_case‿and（子音＋母音） |
| JP | 一致する、または似たフィールド名を手がかりにしてください（snake_case と camelCase の違いも含めて）。 |

| EN | For‿each type you find, decide whether the field must be added, and give the reason. |
|:---|:---|
| 読み | フォ‿リーチ タイプ ユー ファインド、ディサイド ウェザー ザ フィールド マス(ト) ビー アディッド、アン(ド) ギヴ ザ リーズン |
| つながり | For‿each（r＋母音） |
| JP | 見つけた型ごとに、フィールドを追加する必要があるかを判断し、理由を書いてください。 |

| EN | Mark‿it "needs confirmation" if you cannot‿decide. |
|:---|:---|
| 読み | マー‿キッ(ト) "ニーズ コンファメイション" イフ ユー キャナッ‿ディサイド |
| つながり | Mark‿it（子音＋母音） ／ cannot‿decide（同じ・似た子音が続く（前の音は言わない）） |
| JP | 判断できないときは、「要確認」としてください。 |

| EN | Settings‿attached‿to the item (tags / attributes‿such‿as JSON‿names, serialization settings, validation, default values) |
|:---|:---|
| 読み | セッティング‿ザタッチ‿トゥ ジ アイテム（タグズ / アトリビュー‿ツサッ‿チャズ ジェイソ‿ネイムズ、スィアリゼイション セッティングズ、ヴァリデイション、ディフォールト ヴァリューズ） |
| つながり | Settings‿attached（子音＋母音） ／ attached‿to（同じ・似た子音が続く（前の音は言わない）） ／ attributes‿such（同じ・似た子音が続く（前の音は言わない）） ／ such‿as（子音＋母音） ／ JSON‿names（同じ・似た子音が続く（前の音は言わない）） |
| JP | 項目に付随する設定（JSON 名などのタグ・属性、シリアライズの設定、検証、初期値） |

| EN | Conversion code (type conversion functions, mappers, hand-written copying code) |
|:---|:---|
| 読み | コンヴァージョン コウド（タイプ コンヴァージョン ファンクションズ、マッパーズ、ハンドリトゥン コピーイン コウド） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変換処理（型の変換関数、マッパー、手書きの詰め替え処理） |

| EN | The GraphQL schema (schema/), DB migrations, tests, documents, configuration files |
|:---|:---|
| 読み | ザ グラフキューエル スキーマ（スキーマ）、ディービー マイグレイションズ、テスツ、ドキュメンツ、コンフィギュレイション ファイルズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | GraphQL のスキーマ（schema/）、DB のマイグレーション、テスト、文書、設定ファイル |

## [Output]（出力）

読み: アウトプッ(ト) ／ つながり: なし（単語ごとに区切って読む）

| EN | For‿items found‿as "similar", write why you judged them similar (which field names matched). |
|:---|:---|
| 読み | フォ‿ライテムズ ファウン‿ダズ "スィミラー"、ライ(ト) ワイ ユー ジャッジ(ド) ゼム スィミラー（ウィッチ フィールド ネイムズ マッチト） |
| つながり | For‿items（r＋母音） ／ found‿as（子音＋母音） |
| JP | 「類似」として見つけたものには、なぜ似ていると判断したか（どのフィールド名が一致したか）を書いてください。 |

| EN | At the end, report what‿you checked‿in places that‿are hard‿to find by search (reflection, macros, generated code, fields referenced by string). |
|:---|:---|
| 読み | アッ(ト) ジ エンド、リポー(ト) ワッ‿チュー チェック‿ティン プレイスィズ ザ‿ラー ハー‿トゥ ファインド バイ サーチ（リフレクション、マクロウズ、ジェネレイティッ(ド) コウド、フィールズ リファレンス(ト) バイ ストリング） |
| つながり | what‿you（t＋you（チュ）） ／ checked‿in（子音＋母音） ／ that‿are（t＋母音（t がラ行に近い音になる）） ／ hard‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 最後に、検索では見つけにくい場所（リフレクション、マクロ、生成コード、文字列で指定されたフィールド）で何を確認したかを報告してください。 |

---

## この指示文の難しい単語（19 語）

[attach](words.md#attach) ／ [attribute](words.md#attribute) ／ [caller](words.md#caller) ／ [clue](words.md#clue) ／ [conversion](words.md#conversion) ／ [default value](words.md#default-value) ／ [generated code](words.md#generated-code) ／ [implementation](words.md#implementation) ／ [macro](words.md#macro) ／ [mapper](words.md#mapper) ／ [mark](words.md#mark) ／ [missed](words.md#missed) ／ [reflection](words.md#reflection) ／ [related](words.md#related) ／ [serialization](words.md#serialization) ／ [similar](words.md#similar) ／ [tag](words.md#tag) ／ [validation](words.md#validation) ／ [whose](words.md#whose)
