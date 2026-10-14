# 英語の学習 4. 今回やりたいことを仕様にする

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 4 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Organize what I want to do into a spec. |
|:---|:---|
| 読み | オーガナイズ ワッ(ト) アイ ウォン(ト) トゥ ドゥー イントゥ ア スペック |
| JP | 私のやりたいことを、仕様に整理してください。 |

## [What I want to do]（やりたいこと）

読み: ワッ(ト) アイ ウォン(ト) トゥ ドゥー

| EN | Write freely here. Bullet points are fine. |
|:---|:---|
| 読み | ライ(ト) フリーリー ヒア。ブレッ(ト) ポインツ アー ファイン |
| JP | ここに自由に書いてください。箇条書きでかまいません。 |

## [Rules]（ルール）

読み: ルールズ

| EN | Do not add anything to the spec that I did not write. |
|:---|:---|
| 読み | ドゥー ノッ(ト) アッド エニスィング トゥ ザ スペック ザッ(ト) アイ ディドゥン(ト) ライ(ト) |
| JP | 私が書いていないことを、仕様に足さないでください。 |

| EN | Put things you want to add in the "Proposals" section. |
|:---|:---|
| 読み | プッ(ト) スィングズ ユー ウォン トゥ アッド イン ザ "プロポウザルズ" セクション |
| JP | 足したいことは、「提案」の欄に書いてください。 |

| EN | If something is ambiguous, do not decide it in the spec. |
|:---|:---|
| 読み | イフ サムスィン イズ アンビギュアス、ドゥー ノッ(ト) ディサイド イッ(ト) イン ザ スペック |
| JP | あいまいなことは、仕様の中で決めないでください。 |

| EN | Write it as a question in "Questions". |
|:---|:---|
| 読み | ライ(ト) イッ(ト) アズ ア クエスチョン イン "クエスチョンズ" |
| JP | 「質問」の欄に、質問として書いてください。 |

| EN | If you need to know the current spec, you may read the related code and design documents. |
|:---|:---|
| 読み | イフ ユー ニーッ(ド) トゥ ノウ ザ カレン(ト) スペック、ユー メイ リード ザ リレイティッ(ド) コウド アン(ド) ディザイン ドキュメンツ |
| JP | 今の仕様を知る必要があるときは、関連するコードや設計書を読んでかまいません。 |

| EN | Tell me what you read. |
|:---|:---|
| 読み | テル ミー ワッ(ト) ユー レッド |
| JP | 何を読んだかを教えてください。 |

## [Structure of the spec]（仕様の構成）

読み: ストラクチャー オヴ ザ スペック

| EN | Purpose |
|:---|:---|
| 読み | パーパス |
| JP | 目的 |

| EN | Scope (what to do / what not to do) |
|:---|:---|
| 読み | スコウプ（ワッ(ト) トゥ ドゥー / ワッ(ト) ナッ(ト) トゥ ドゥー） |
| JP | 範囲（やること / やらないこと） |

| EN | Input and output (types, constraints, examples) |
|:---|:---|
| 読み | インプッ(ト) アン(ド) アウトプッ(ト)（タイプス、コンストレインツ、イグザンプルズ） |
| JP | 入力と出力（型、制約、例） |

| EN | Behavior (normal cases / error cases / boundary values) |
|:---|:---|
| 読み | ビヘイヴィアー（ノーマル ケイスィズ / エラー ケイスィズ / バウンダリー ヴァリューズ） |
| JP | 振る舞い（正常系 / 異常系 / 境界値） |

| EN | Acceptance criteria (written so that they can be turned into tests: "when X, then Y") |
|:---|:---|
| 読み | アクセプタンス クライティアリア（リトゥン ソウ ザッ(ト) ゼイ キャン ビー ターンド イントゥ テスツ："ウェン エックス、ゼン ワイ"） |
| JP | 受け入れ条件（テストに書き換えられるように書く:「X のとき、Y になる」） |

| EN | Impact on existing behavior (what changes / what must not change) |
|:---|:---|
| 読み | インパクト オン イグズィスティン ビヘイヴィアー（ワッ(ト) チェインジズ / ワッ(ト) マスト ナッ(ト) チェインジ） |
| JP | 既存の動作への影響（変わるもの / 変えてはいけないもの） |

| EN | Proposals (things I did not write, but you think would be good to have) |
|:---|:---|
| 読み | プロポウザルズ（スィングズ アイ ディドゥン(ト) ライ(ト)、バッ(ト) ユー スィンク ウッ(ド) ビー グッ(ド) トゥ ハヴ） |
| JP | 提案（私が書いていないが、あるとよいと思うこと） |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | When you finish, show me only the "Questions" and wait for my answers. |
|:---|:---|
| 読み | ウェン ユー フィニッシュ、ショウ ミー オウンリー ザ "クエスチョンズ" アン(ド) ウェイ(ト) フォー マイ アンサーズ |
| JP | 終わったら、「質問」だけを私に見せて、私の回答を待ってください。 |

---

## この指示文の難しい単語（8 語）

[acceptance criteria](words.md#acceptance-criteria) ／ [ambiguous](words.md#ambiguous) ／ [boundary value](words.md#boundary-value) ／ [impact](words.md#impact) ／ [organize](words.md#organize) ／ [proposal](words.md#proposal) ／ [purpose](words.md#purpose) ／ [scope](words.md#scope)
