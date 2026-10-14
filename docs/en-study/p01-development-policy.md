# 英語の学習 1. 開発方針（マージ済み PR のレビュー指摘）

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 1 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Investigate the past pull requests of this repository, and organize its "development policy" from the review comments, in Markdown. |
|:---|:---|
| 読み | インヴェスティゲイ(ト) ザ パス(ト) プル リクエスツ オヴ ディス リポズィトリー、アン(ド) オーガナイズ イッツ "ディヴェロップメン(ト) ポリスィ" フロム ザ リヴュー コメンツ、イン マークダウン |
| JP | このリポジトリの過去のプルリクエストを調べ、レビューコメントから「開発方針」を Markdown に整理してください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ノッ(ト) マディファイ エニィ コウド |
| JP | コードは変更しないでください。 |

## [Scope]（対象）

読み: スコウプ

| EN | Only merged PRs. |
|:---|:---|
| 読み | オウンリー マージド ピーアールズ |
| JP | マージ済みの PR だけです。 |

| EN | PRs that were closed without being merged are out of scope. |
|:---|:---|
| 読み | ピーアールズ ザッ(ト) ワー クロウズド ウィズアウ(ト) ビーイン マージド アー アウトヴ スコウプ |
| JP | マージされずに閉じた PR は対象外です。 |

## [What counts as an "adopted" review comment]（「採用された」レビュー指摘とみなす条件）

読み: ワッ カウンツ アザン "アダプティッド" リヴュー コメン(ト)

| EN | A comment counts as "adopted" only if it meets one of these: |
|:---|:---|
| 読み | ア コメン(ト) カウンツ アズ "アダプティッド" オウンリー イフ イッ(ト) ミーツ ワン オヴ ズィーズ |
| JP | 指摘は、次のどれかを満たすときだけ「採用された」とみなします。 |

| EN | It is followed by a commit that makes the change the comment asked for. |
|:---|:---|
| 読み | イッ(ト) イズ フォロウド バイ ア カミッ(ト) ザッ(ト) メイクス ザ チェインジ ザ コメン(ト) アスクト フォー |
| JP | 指摘のあとに、指摘が求めた変更をするコミットがある。 |

| EN | Its thread is Resolved, and a reply agrees to make the change. |
|:---|:---|
| 読み | イッツ スレッド イズ リゾルヴド、アン ダ リプライ アグリーズ トゥ メイク ザ チェインジ |
| JP | 指摘のスレッドが Resolved で、返信がその変更に同意している。 |

| EN | Put comments that meet neither into a separate group: "not adopted / unknown". |
|:---|:---|
| 読み | プッ(ト) コメンツ ザッ(ト) ミーッ(ト) ナイザー イントゥ ア セパレッ(ト) グループ："ノッ(ト) アダプティッド / アンノウン" |
| JP | どちらにも当てはまらない指摘は、別のグループ「採用されなかった／不明」に入れてください。 |

## [How to investigate]（調べ方）

読み: ハウ トゥ インヴェスティゲイ(ト)

| EN | Use the gh command to fetch the PR list, the review comments, and the commits made after each comment. |
|:---|:---|
| 読み | ユーズ ザ ジーエイチ コマンド トゥ フェッチ ザ ピーアール リスト、ザ リヴュー コメンツ、アン(ド) ザ カミッツ メイド アフター イーチ コメン(ト) |
| JP | gh コマンドで、PR の一覧、レビューコメント、各コメントのあとのコミットを取得してください。 |

| EN | If you cannot fetch them, say so and ask me how to get the data. |
|:---|:---|
| 読み | イフ ユー キャナッ(ト) フェッチ ゼム、セイ ソウ アン アスク ミー ハウ トゥ ゲッ(ト) ザ デイタ |
| JP | 取得できないときは、そう伝えて、データの取り方を私に聞いてください。 |

## [How to organize]（整理のしかた）

読み: ハウ トゥ オーガナイズ

| EN | Merge comments with the same intent into one policy. |
|:---|:---|
| 読み | マージ コメンツ ウィズ ザ セイム インテン(ト) イントゥ ワン ポリスィ |
| JP | 同じ意図の指摘は、1 つの方針にまとめてください。 |

| EN | For each policy, write: |
|:---|:---|
| 読み | フォー イーチ ポリスィ、ライ(ト) |
| JP | 方針ごとに、次を書いてください: |

| EN | The policy (one sentence, in the form "do X" or "do not do X") |
|:---|:---|
| 読み | ザ ポリスィ（ワン センテンス、イン ザ フォーム "ドゥー エックス" オア "ドゥー ノッ(ト) ドゥー エックス"） |
| JP | 方針（1 文。「X する」または「X しない」の形） |

| EN | The reason (what was said in the review) |
|:---|:---|
| 読み | ザ リーズン（ワッ(ト) ワズ セッ(ド) イン ザ リヴュー） |
| JP | 理由（レビューで述べられていたこと） |

| EN | A good example / a bad example (keep code excerpts short) |
|:---|:---|
| 読み | ア グッ(ド) イグザンプル / ア バッ(ド) イグザンプル（キープ コウド エクサープツ ショー(ト)） |
| JP | 良い例 / 悪い例（コードの抜粋は短く） |

| EN | Evidence (PR numbers and comment URLs; all of them if there are several) |
|:---|:---|
| 読み | エヴィデンス（ピーアール ナンバーズ アン(ド) コメン(ト) ユーアールエルズ；オール オヴ ゼム イフ ゼア アー セヴラル） |
| JP | 根拠（PR 番号とコメントの URL。複数あれば全部） |

| EN | Frequency (in how many PRs it was raised) |
|:---|:---|
| 読み | フリークウェンスィ（イン ハウ メニィ ピーアールズ イッ(ト) ワズ レイズド） |
| JP | 頻度（何件の PR で指摘されたか） |

| EN | A comment raised in only one PR is not a policy. |
|:---|:---|
| 読み | ア コメン(ト) レイズディン オウンリー ワン ピーアール イズ ノッ(ト) ア ポリスィ |
| JP | 1 件の PR にしか出ていない指摘は、方針ではありません。 |

| EN | Put it in "one-off comments". |
|:---|:---|
| 読み | プッ(ト) イッ(ト) イン "ワンオフ コメンツ" |
| JP | 「単発の指摘」に入れてください。 |

| EN | Separate what the comments said (facts) from your own interpretation. |
|:---|:---|
| 読み | セパレイ(ト) ワッ(ト) ザ コメンツ セッ(ド)（ファクツ）フロム ヨア オウン インタープリテイション |
| JP | コメントに書かれていたこと（事実）と、あなた自身の解釈を分けてください。 |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | Structure: Summary / Policies (most frequent first) / One-off comments / Comments not adopted / Scope and method of the investigation |
|:---|:---|
| 読み | ストラクチャー：サマリー / ポリスィズ（モウスト フリークウェン(ト) ファースト）/ ワンオフ コメンツ / コメンツ ナッ(ト) アダプティッド / スコウプ アン(ド) メソッド オヴ ジ インヴェスティゲイション |
| JP | 構成: 概要 / 方針（頻度の高い順）/ 単発の指摘 / 採用されなかった指摘 / 調査の範囲と方法 |

---

## この指示文の難しい単語（18 語）

[adopted](words.md#adopted) ／ [agree](words.md#agree) ／ [evidence](words.md#evidence) ／ [excerpt](words.md#excerpt) ／ [fetch](words.md#fetch) ／ [follow](words.md#follow) ／ [frequency](words.md#frequency) ／ [intent](words.md#intent) ／ [interpretation](words.md#interpretation) ／ [investigate](words.md#investigate) ／ [meet](words.md#meet) ／ [merged](words.md#merged) ／ [one-off](words.md#one-off) ／ [organize](words.md#organize) ／ [policy](words.md#policy) ／ [resolved](words.md#resolved) ／ [scope](words.md#scope) ／ [thread](words.md#thread)
