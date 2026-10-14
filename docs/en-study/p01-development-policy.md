# 英語の学習 1. 開発方針（マージ済み PR のレビュー指摘）

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 1 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Investigate the past pull requests‿of this repository, and‿organize‿its "development policy" from the review comments, in Markdown. |
|:---|:---|
| 読み | インヴェスティゲイ(ト) ザ パス(ト) プル リクエス‿ツォヴ ディス リポズィトリー、アン‿ドーガナイ‿ズィッツ "ディヴェロップメン(ト) ポリスィ" フロム ザ リヴュー コメンツ、イン マークダウン |
| つながり | requests‿of（子音＋母音） ／ and‿organize（子音＋母音） ／ organize‿its（子音＋母音） |
| JP | このリポジトリの過去のプルリクエストを調べ、レビューコメントから「開発方針」を Markdown に整理してください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ナッ(ト) マディファイ エニィ コウド |
| つながり | なし（単語ごとに区切って読む） |
| JP | コードは変更しないでください。 |

## [Scope]（対象）

読み: スコウプ

| EN | Only merged PRs. |
|:---|:---|
| 読み | オウンリー マージド ピーアールズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | マージ済みの PR だけです。 |

| EN | PRs that were closed without being merged‿are‿out‿of scope. |
|:---|:---|
| 読み | ピーアールズ ザッ(ト) ワー クロウズ(ド) ウィザウ(ト) ビーイン マージ‿ダ‿ラウ‿ロヴ スコウプ |
| つながり | merged‿are（子音＋母音） ／ are‿out（r＋母音） ／ out‿of（t＋母音（t がラ行に近い音になる）） |
| JP | マージされずに閉じた PR は対象外です。 |

## [What counts as an "adopted" review comment]（「採用された」レビュー指摘とみなす条件）

読み: ワッ カウンツ アザン "アダプティッド" リヴュー コメン(ト)

| EN | A comment counts‿as "adopted" only if‿it meets one‿of these: |
|:---|:---|
| 読み | ア コメン(ト) カウン‿ツァズ "アダプティッド" オウンリー イ‿フィッ(ト) ミーツ ワ‿ノヴ ズィーズ |
| つながり | counts‿as（子音＋母音） ／ if‿it（子音＋母音） ／ one‿of（子音＋母音） |
| JP | 指摘は、次のどれかを満たすときだけ「採用された」とみなします。 |

| EN | It‿is followed by a commit that makes the change the comment‿asked for. |
|:---|:---|
| 読み | イ‿リズ フォロウ(ド) バイ ア カミッ(ト) ザッ(ト) メイクス ザ チェインジ ザ コメ‿ナスク(ト) フォー |
| つながり | It‿is（t＋母音（t がラ行に近い音になる）） ／ comment‿asked（t＋母音（t がラ行に近い音になる）） |
| JP | 指摘のあとに、指摘が求めた変更をするコミットがある。 |

| EN | Its thread‿is Resolved, and‿a reply agrees to make the change. |
|:---|:---|
| 読み | イッツ スレッ‿ディズ リゾルヴド、アン‿ダ リプライ アグリーズ トゥ メイク ザ チェインジ |
| つながり | thread‿is（子音＋母音） ／ and‿a（子音＋母音） |
| JP | 指摘のスレッドが Resolved で、返信がその変更に同意している。 |

| EN | Put comments that meet neither‿into a separate group: "not‿adopted / unknown". |
|:---|:---|
| 読み | プッ(ト) コメンツ ザッ(ト) ミー(ト) ナイザ‿リントゥ ア セパレッ(ト) グループ："ナ‿ラダプティッド / アンノウン" |
| つながり | neither‿into（r＋母音） ／ not‿adopted（t＋母音（t がラ行に近い音になる）） |
| JP | どちらにも当てはまらない指摘は、別のグループ「採用されなかった／不明」に入れてください。 |

## [How to investigate]（調べ方）

読み: ハウ トゥ インヴェスティゲイ(ト)

| EN | Use the gh command‿to fetch the PR list, the review comments, and the commits made‿after‿each comment. |
|:---|:---|
| 読み | ユーズ ザ ジーエイチ コマン‿トゥ フェッチ ザ ピーアール リスト、ザ リヴュー コメンツ、アン(ド) ザ カミッツ メイ‿ダフタ‿リーチ コメン(ト) |
| つながり | command‿to（同じ・似た子音が続く（前の音は言わない）） ／ made‿after（子音＋母音） ／ after‿each（r＋母音） |
| JP | gh コマンドで、PR の一覧、レビューコメント、各コメントのあとのコミットを取得してください。 |

| EN | If you cannot fetch them, say so and‿ask me how to get the data. |
|:---|:---|
| 読み | イフ ユー キャナッ(ト) フェッチ ゼム、セイ ソウ アン‿ダスク ミー ハウ トゥ ゲッ(ト) ザ デイタ |
| つながり | and‿ask（子音＋母音） |
| JP | 取得できないときは、そう伝えて、データの取り方を私に聞いてください。 |

## [How to organize]（整理のしかた）

読み: ハウ トゥ オーガナイズ

| EN | Merge comments with the same‿intent‿into one policy. |
|:---|:---|
| 読み | マージ コメンツ ウィズ ザ セイ‿ミンテ‿ニントゥ ワン ポリスィ |
| つながり | same‿intent（子音＋母音） ／ intent‿into（t＋母音（t がラ行に近い音になる）） |
| JP | 同じ意図の指摘は、1 つの方針にまとめてください。 |

| EN | For‿each policy, write: |
|:---|:---|
| 読み | フォ‿リーチ ポリスィ、ライ(ト) |
| つながり | For‿each（r＋母音） |
| JP | 方針ごとに、次を書いてください: |

| EN | The policy (one sentence, in the form "do X" or "do not‿do X") |
|:---|:---|
| 読み | ザ ポリスィ（ワン センテンス、イン ザ フォーム "ドゥー エックス" オア "ドゥー ナッ‿ドゥー エックス"） |
| つながり | not‿do（同じ・似た子音が続く（前の音は言わない）） |
| JP | 方針（1 文。「X する」または「X しない」の形） |

| EN | The reason (what was‿said‿in the review) |
|:---|:---|
| 読み | ザ リーズン（ワッ(ト) ワ‿セッ‿ディン ザ リヴュー） |
| つながり | was‿said（同じ・似た子音が続く（前の音は言わない）） ／ said‿in（子音＋母音） |
| JP | 理由（レビューで述べられていたこと） |

| EN | A good‿example / a bad‿example (keep code‿excerpts short) |
|:---|:---|
| 読み | ア グッ‿ディグザンプル / ア バッ‿ディグザンプル（キー(プ) コウ‿デクサープツ ショー(ト)） |
| つながり | good‿example（子音＋母音） ／ bad‿example（子音＋母音） ／ code‿excerpts（子音＋母音） |
| JP | 良い例 / 悪い例（コードの抜粋は短く） |

| EN | Evidence (PR numbers‿and comment URLs; all‿of them‿if there‿are several) |
|:---|:---|
| 読み | エヴィデンス（ピーアール ナンバー‿ザン(ド) コメン(ト) ユーアールエルズ；オー‿ロヴ ゼ‿ミフ ゼア‿ラー セヴラル） |
| つながり | numbers‿and（子音＋母音） ／ all‿of（子音＋母音） ／ them‿if（子音＋母音） ／ there‿are（r＋母音） |
| JP | 根拠（PR 番号とコメントの URL。複数あれば全部） |

| EN | Frequency (in how many PRs‿it was raised) |
|:---|:---|
| 読み | フリークウェンスィ（イン ハウ メニィ ピーアール‿ズィッ(ト) ワズ レイズド） |
| つながり | PRs‿it（子音＋母音） |
| JP | 頻度（何件の PR で指摘されたか） |

| EN | A comment raised‿in‿only one PR‿is not‿a policy. |
|:---|:---|
| 読み | ア コメン(ト) レイズ‿ディ‿ノウンリー ワン ピーアー‿リズ ナ‿ラ ポリスィ |
| つながり | raised‿in（子音＋母音） ／ in‿only（子音＋母音） ／ PR‿is（r＋母音） ／ not‿a（t＋母音（t がラ行に近い音になる）） |
| JP | 1 件の PR にしか出ていない指摘は、方針ではありません。 |

| EN | Put‿it‿in "one-off comments". |
|:---|:---|
| 読み | プ‿リ‿リン "ワノフ コメンツ" |
| つながり | Put‿it（t＋母音（t がラ行に近い音になる）） ／ it‿in（t＋母音（t がラ行に近い音になる）） |
| JP | 「単発の指摘」に入れてください。 |

| EN | Separate what the comments‿said (facts) from your‿own‿interpretation. |
|:---|:---|
| 読み | セパレイ(ト) ワッ(ト) ザ コメン‿ツェッ(ド)（ファクツ）フロム ヨア‿ロウ‿ニンタープリテイション |
| つながり | comments‿said（同じ・似た子音が続く（前の音は言わない）） ／ your‿own（r＋母音） ／ own‿interpretation（子音＋母音） |
| JP | コメントに書かれていたこと（事実）と、あなた自身の解釈を分けてください。 |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | Structure: Summary / Policies (most frequent first) / One-off comments / Comments not‿adopted / Scope‿and method‿of the investigation |
|:---|:---|
| 読み | ストラクチャー：サマリー / ポリスィズ（モウスト フリークウェン(ト) ファースト）/ ワノフ コメンツ / コメンツ ナ‿ラダプティッド / スコウ‿パン(ド) メソッ‿ドヴ ジ インヴェスティゲイション |
| つながり | not‿adopted（t＋母音（t がラ行に近い音になる）） ／ Scope‿and（子音＋母音） ／ method‿of（子音＋母音） |
| JP | 構成: 概要 / 方針（頻度の高い順）/ 単発の指摘 / 採用されなかった指摘 / 調査の範囲と方法 |

---

## この指示文の難しい単語（18 語）

[adopted](words.md#adopted) ／ [agree](words.md#agree) ／ [evidence](words.md#evidence) ／ [excerpt](words.md#excerpt) ／ [fetch](words.md#fetch) ／ [follow](words.md#follow) ／ [frequency](words.md#frequency) ／ [intent](words.md#intent) ／ [interpretation](words.md#interpretation) ／ [investigate](words.md#investigate) ／ [meet](words.md#meet) ／ [merged](words.md#merged) ／ [one-off](words.md#one-off) ／ [organize](words.md#organize) ／ [policy](words.md#policy) ／ [resolved](words.md#resolved) ／ [scope](words.md#scope) ／ [thread](words.md#thread)
