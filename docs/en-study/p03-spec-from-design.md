# 英語の学習 3. 設計書から仕様を調べる

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 3 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Read the current design document and organize the spec of &lt;target feature&gt; in Markdown. |
|:---|:---|
| 読み | リード ザ カレン(ト) ディザイン ドキュメン(ト) アン(ド) オーガナイズ ザ スペック オヴ &lt;ターゲッ(ト) フィーチャー&gt; イン マークダウン |
| JP | 今の設計書を読んで、&lt;対象の機能&gt; の仕様を Markdown に整理してください。 |

## [Design document]（対象の設計書）

読み: ディザイン ドキュメン(ト)

| EN | If it is not specified or not found, look in docs/ and elsewhere, and tell me which document you read. |
|:---|:---|
| 読み | イフ イッ(ト) イズ ノッ(ト) スペスィファイド オア ノッ(ト) ファウンド、ルック イン ドックス アン エルスウェア、アン(ド) テル ミー ウィッチ ドキュメン(ト) ユー レッド |
| JP | 指定がない、または見つからないときは、docs/ などを探して、どの文書を読んだかを教えてください。 |

## [Premise]（前提）

読み: プレミス

| EN | Organize only what the design document says. |
|:---|:---|
| 読み | オーガナイズ オウンリー ワッ(ト) ザ ディザイン ドキュメン(ト) セズ |
| JP | 設計書に書かれていることだけを整理してください。 |

| EN | Do not read the code (comparing with the code is a separate task). |
|:---|:---|
| 読み | ドゥー ノッ(ト) リード ザ コウド（コンペアリン ウィズ ザ コウド イズ ア セパレッ(ト) タスク） |
| JP | コードは読まないでください（コードとの比較は別の依頼です）。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ノッ(ト) マディファイ エニィ コウド |
| JP | コードは変更しないでください。 |

## [What to organize]（整理する内容）

読み: ワッ(ト) トゥ オーガナイズ

| EN | Purpose / Input / Output / Flow / Errors / Constraints / Non-functional requirements (performance, availability, security) |
|:---|:---|
| 読み | パーパス / インプッ(ト) / アウトプッ(ト) / フロウ / エラーズ / コンストレインツ / ノンファンクショナル リクワイアメンツ（パフォーマンス、アヴェイラビリティ、スィキュリティ） |
| JP | 目的 / 入力 / 出力 / 処理の流れ / エラー / 制約 / 非機能要件（性能、可用性、セキュリティ） |

## [How to write]（書き方）

読み: ハウ トゥ ライ(ト)

| EN | For each item, say which section of the design document it comes from. |
|:---|:---|
| 読み | フォー イーチ アイテム、セイ ウィッチ セクション オヴ ザ ディザイン ドキュメン(ト) イッ(ト) カムズ フロム |
| JP | 各項目について、設計書のどの章から来たかを書いてください。 |

| EN | List contradictory, vague, and undecided (TBD) points in the design document as "Needs confirmation". |
|:---|:---|
| 読み | リス(ト) コントラディクトリー、ヴェイグ、アン(ド) アンディサイデッド（ティービーディー）ポインツ イン ザ ディザイン ドキュメン(ト) アズ "ニーズ コンファメイション" |
| JP | 設計書の中の、矛盾している点・あいまいな点・未定（TBD）の点は、「要確認」として一覧にしてください。 |

| EN | If you can tell the last-updated date or version of the document, write it (to judge whether it may be outdated). |
|:---|:---|
| 読み | イフ ユー キャン テル ザ ラス(ト) アップデイティッ(ド) デイ(ト) オア ヴァージョン オヴ ザ ドキュメン(ト)、ライティッ(ト)（トゥ ジャッジ ウェザー イッ(ト) メイ ビー アウトデイティッド） |
| JP | 文書の最終更新日や版が分かるなら、書いてください（古い可能性を判断するため）。 |

---

## この指示文の難しい単語（10 語）

[constraint](words.md#constraint) ／ [contradictory](words.md#contradictory) ／ [design document](words.md#design-document) ／ [non-functional requirements](words.md#non-functional-requirements) ／ [organize](words.md#organize) ／ [outdated](words.md#outdated) ／ [premise](words.md#premise) ／ [purpose](words.md#purpose) ／ [undecided](words.md#undecided) ／ [vague](words.md#vague)
