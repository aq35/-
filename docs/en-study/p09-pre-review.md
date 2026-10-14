# 英語の学習 9. 開発方針に照らして事前レビューする

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 9 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Review the changes‿on the current branch‿against the development policy. |
|:---|:---|
| 読み | リヴュー ザ チェインジ‿ゾン ザ カレン(ト) ブラン‿チャゲンスト ザ ディヴェロップメン(ト) ポリスィ |
| つながり | changes‿on（子音＋母音） ／ branch‿against（子音＋母音） |
| JP | 今のブランチの変更を、開発方針に照らしてレビューしてください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ナッ(ト) マディファイ エニィ コウド |
| つながり | なし（単語ごとに区切って読む） |
| JP | コードは変更しないでください。 |

## [Target]（対象）

読み: ターゲッ(ト)

| EN | Changes |
|:---|:---|
| 読み | チェインジズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変更（の範囲） |

| EN | Development policy |
|:---|:---|
| 読み | ディヴェロップメン(ト) ポリスィ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 開発方針（の文書） |

## [Request]（お願い）

読み: リクエスト

| EN | For‿each policy item, judge whether this change "follows‿it / breaks‿it / is not related". |
|:---|:---|
| 読み | フォ‿リーチ ポリスィ アイテム、ジャッジ ウェザー ディス チェインジ "フォロウ‿ズィッ(ト) / ブレイク‿スィッ(ト) / イズ ナッ(ト) リレイティッド" |
| つながり | For‿each（r＋母音） ／ follows‿it（子音＋母音） ／ breaks‿it（子音＋母音） |
| JP | 方針の項目ごとに、この変更が「守っている / 破っている / 関係ない」のどれかを判定してください。 |

| EN | For "breaks‿it", give the path‿and line‿of the code, the policy item, and‿a suggested fix. |
|:---|:---|
| 読み | フォー "ブレイク‿スィッ(ト)"、ギヴ ザ パ‿サン(ド) ライ‿ノヴ ザ コウド、ザ ポリスィ アイテム、アン‿ダ サジェスティッ(ド) フィックス |
| つながり | breaks‿it（子音＋母音） ／ path‿and（子音＋母音） ／ line‿of（子音＋母音） ／ and‿a（子音＋母音） |
| JP | 「破っている」には、コードのパスと行、方針の項目、直し方の案を書いてください。 |

| EN | If you find‿issues that‿are not‿in the policy (bugs, boundary conditions, error handling), put them‿in‿a separate section. |
|:---|:---|
| 読み | イフ ユー ファイン‿ディシューズ ザ‿ラー ナ‿リン ザ ポリスィ（バグズ、バウンダリー コンディションズ、エラー ハンドリン）、プッ(ト) ゼ‿ミ‿ナ セパレッ(ト) セクション |
| つながり | find‿issues（子音＋母音） ／ that‿are（t＋母音（t がラ行に近い音になる）） ／ not‿in（t＋母音（t がラ行に近い音になる）） ／ them‿in（子音＋母音） ／ in‿a（子音＋母音） |
| JP | 方針にない問題（バグ、境界条件、エラー処理）を見つけたら、別の節に分けてください。 |

| EN | If there‿is no problem, write "No issues". |
|:---|:---|
| 読み | イフ ゼア‿リズ ノウ プロブレム、ライ(ト) "ノウ イシューズ" |
| つながり | there‿is（r＋母音） |
| JP | 問題がなければ、「問題なし」と書いてください。 |

| EN | Do not‿invent findings. |
|:---|:---|
| 読み | ドゥー ナ‿リンヴェン(ト) ファインディングズ |
| つながり | not‿invent（t＋母音（t がラ行に近い音になる）） |
| JP | 指摘をでっち上げないでください。 |

---

## この指示文の難しい単語（6 語）

[break](words.md#break) ／ [finding](words.md#finding) ／ [follow](words.md#follow) ／ [invent](words.md#invent) ／ [policy](words.md#policy) ／ [suggested](words.md#suggested)
