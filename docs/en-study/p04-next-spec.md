# 英語の学習 4. 今回やりたいことを仕様にする

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 4 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Organize what‿I want‿to do into a spec. |
|:---|:---|
| 読み | オーガナイズ ワ‿ライ ウォン‿トゥ ドゥー イントゥ ア スペック |
| つながり | what‿I（t＋母音（t がラ行に近い音になる）） ／ want‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 私のやりたいことを、仕様に整理してください。 |

## [What‿I want‿to do]（やりたいこと）

読み: ワ‿ライ ウォン‿トゥ ドゥー ／ つながり: What‿I（t＋母音（t がラ行に近い音になる）） ／ want‿to（同じ・似た子音が続く（前の音は言わない））

| EN | Write freely here. Bullet points‿are fine. |
|:---|:---|
| 読み | ライ(ト) フリーリー ヒア。ブレッ(ト) ポイン‿ツァー ファイン |
| つながり | points‿are（子音＋母音） |
| JP | ここに自由に書いてください。箇条書きでかまいません。 |

## [Rules]（ルール）

読み: ルールズ ／ つながり: なし（単語ごとに区切って読む）

| EN | Do not‿add‿anything to the spec that‿I did not write. |
|:---|:---|
| 読み | ドゥー ナ‿ラッ‿デニスィング トゥ ザ スペック ザ‿ライ ディッ(ド) ナッ(ト) ライ(ト) |
| つながり | not‿add（t＋母音（t がラ行に近い音になる）） ／ add‿anything（子音＋母音） ／ that‿I（t＋母音（t がラ行に近い音になる）） |
| JP | 私が書いていないことを、仕様に足さないでください。 |

| EN | Put things you want‿to add‿in the "Proposals" section. |
|:---|:---|
| 読み | プッ(ト) スィングズ ユー ウォン‿トゥ ア‿ディン ザ "プロポウザルズ" セクション |
| つながり | want‿to（同じ・似た子音が続く（前の音は言わない）） ／ add‿in（子音＋母音） |
| JP | 足したいことは、「提案」の欄に書いてください。 |

| EN | If something‿is‿ambiguous, do not‿decide‿it‿in the spec. |
|:---|:---|
| 読み | イフ サムスィン‿ギ‿ザンビギュアス、ドゥー ナッ‿ディサイ‿ディ‿リン ザ スペック |
| つながり | something‿is（子音＋母音） ／ is‿ambiguous（子音＋母音） ／ not‿decide（同じ・似た子音が続く（前の音は言わない）） ／ decide‿it（子音＋母音） ／ it‿in（t＋母音（t がラ行に近い音になる）） |
| JP | あいまいなことは、仕様の中で決めないでください。 |

| EN | Write‿it‿as‿a question‿in "Questions". |
|:---|:---|
| 読み | ライ‿リ‿ラ‿ザ クエスチョ‿ニン "クエスチョンズ" |
| つながり | Write‿it（t＋母音（t がラ行に近い音になる）） ／ it‿as（t＋母音（t がラ行に近い音になる）） ／ as‿a（子音＋母音） ／ question‿in（子音＋母音） |
| JP | 「質問」の欄に、質問として書いてください。 |

| EN | If you need‿to know the current spec, you may read the related code‿and‿design documents. |
|:---|:---|
| 読み | イフ ユー ニー‿トゥ ノウ ザ カレン(ト) スペック、ユー メイ リー(ド) ザ リレイティッ(ド) コウ‿ダン‿ディザイン ドキュメンツ |
| つながり | need‿to（同じ・似た子音が続く（前の音は言わない）） ／ code‿and（子音＋母音） ／ and‿design（同じ・似た子音が続く（前の音は言わない）） |
| JP | 今の仕様を知る必要があるときは、関連するコードや設計書を読んでかまいません。 |

| EN | Tell me what‿you read. |
|:---|:---|
| 読み | テル ミー ワッ‿チュー レッド |
| つながり | what‿you（t＋you（チュ）） |
| JP | 何を読んだかを教えてください。 |

## [Structure‿of the spec]（仕様の構成）

読み: ストラクチャ‿ロヴ ザ スペック ／ つながり: Structure‿of（r＋母音）

| EN | Purpose |
|:---|:---|
| 読み | パーパス |
| つながり | なし（単語ごとに区切って読む） |
| JP | 目的 |

| EN | Scope (what‿to do / what not‿to do) |
|:---|:---|
| 読み | スコウプ（ワッ‿トゥ ドゥー / ワッ(ト) ナッ‿トゥ ドゥー） |
| つながり | what‿to（同じ・似た子音が続く（前の音は言わない）） ／ not‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 範囲（やること / やらないこと） |

| EN | Input‿and‿output (types, constraints, examples) |
|:---|:---|
| 読み | インプッ‿タン‿ダウトプッ(ト)（タイプス、コンストレインツ、イグザンプルズ） |
| つながり | Input‿and（t＋母音（t がラ行に近い音になる）） ／ and‿output（子音＋母音） |
| JP | 入力と出力（型、制約、例） |

| EN | Behavior (normal cases / error cases / boundary values) |
|:---|:---|
| 読み | ビヘイヴィアー（ノーマル ケイスィズ / エラー ケイスィズ / バウンダリー ヴァリューズ） |
| つながり | なし（単語ごとに区切って読む） |
| JP | 振る舞い（正常系 / 異常系 / 境界値） |

| EN | Acceptance criteria (written so that they can be turned‿into tests: "when‿X, then Y") |
|:---|:---|
| 読み | アクセプタンス クライティアリア（リトゥン ソウ ザッ(ト) ゼイ キャン ビー ターン‿ディントゥ テスツ："ウェ‿ネックス、ゼン ワイ"） |
| つながり | turned‿into（子音＋母音） ／ when‿X（子音＋母音） |
| JP | 受け入れ条件（テストに書き換えられるように書く:「X のとき、Y になる」） |

| EN | Impact‿on‿existing behavior (what changes / what must not change) |
|:---|:---|
| 読み | インパク‿トン‿ニグズィスティン ビヘイヴィアー（ワッ(ト) チェインジズ / ワッ(ト) マス(ト) ナッ(ト) チェインジ） |
| つながり | Impact‿on（t＋母音（t がラ行に近い音になる）） ／ on‿existing（子音＋母音） |
| JP | 既存の動作への影響（変わるもの / 変えてはいけないもの） |

| EN | Proposals (things‿I did not write, but‿you think would be good‿to have) |
|:---|:---|
| 読み | プロポウザルズ（スィング‿ザイ ディッ(ド) ナッ(ト) ライ(ト)、バッ‿チュー スィンク ウッ(ド) ビー グッ‿トゥ ハヴ） |
| つながり | things‿I（子音＋母音） ／ but‿you（t＋you（チュ）） ／ good‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 提案（私が書いていないが、あるとよいと思うこと） |

## [Output]（出力）

読み: アウトプッ(ト) ／ つながり: なし（単語ごとに区切って読む）

| EN | When you finish, show me only the "Questions" and wait for my answers. |
|:---|:---|
| 読み | ウェン ユー フィニッシュ、ショウ ミー オウンリー ザ "クエスチョンズ" アン(ド) ウェイ(ト) フォー マイ アンサーズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 終わったら、「質問」だけを私に見せて、私の回答を待ってください。 |

---

## この指示文の難しい単語（8 語）

[acceptance criteria](words.md#acceptance-criteria) ／ [ambiguous](words.md#ambiguous) ／ [boundary value](words.md#boundary-value) ／ [impact](words.md#impact) ／ [organize](words.md#organize) ／ [proposal](words.md#proposal) ／ [purpose](words.md#purpose) ／ [scope](words.md#scope)
