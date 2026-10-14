# 英語の学習 6. テストコードを書く

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 6 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Write‿test code based‿on what‿I want‿to do this time. |
|:---|:---|
| 読み | ライ‿テス(ト) コウド ベイス‿トン ワ‿ライ ウォン‿トゥ ドゥー ディス タイム |
| つながり | Write‿test（同じ・似た子音が続く（前の音は言わない）） ／ based‿on（子音＋母音） ／ what‿I（t＋母音（t がラ行に近い音になる）） ／ want‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 今回やりたいことをもとに、テストコードを書いてください。 |

## [What‿I want‿to do]（やりたいこと）

読み: ワ‿ライ ウォン‿トゥ ドゥー ／ つながり: What‿I（t＋母音（t がラ行に近い音になる）） ／ want‿to（同じ・似た子音が続く（前の音は言わない））

| EN | The path‿of the spec file (e.g. docs/spec/xxx-next.md), or write‿it‿directly here |
|:---|:---|
| 読み | ザ パ‿ソヴ ザ スペック ファイル（イー ジー ドックス スペック エックス エックス エックス ネクスト ドッ(ト) エムディー）、オア ライ‿リッ‿ダイレクトリー ヒア |
| つながり | path‿of（子音＋母音） ／ write‿it（t＋母音（t がラ行に近い音になる）） ／ it‿directly（同じ・似た子音が続く（前の音は言わない）） |
| JP | 仕様ファイルのパス（例: docs/spec/xxx-next.md）、またはここに直接書いてください。 |

## [What‿you may change]（変更してよいもの）

読み: ワッ‿チュー メイ チェインジ ／ つながり: What‿you（t＋you（チュ））

| EN | Test code‿only (test files, or the test part‿inside the same file). |
|:---|:---|
| 読み | テス(ト) コウ‿ドウンリー（テス(ト) ファイルズ、オア ザ テス(ト) パー‿ティンサイド ザ セイム ファイル） |
| つながり | code‿only（子音＋母音） ／ part‿inside（t＋母音（t がラ行に近い音になる）） |
| JP | テスト用のコードだけです（テストファイル、または同じファイルの中のテスト部分）。 |

| EN | Do not change the non-test part (production code) by even one line. |
|:---|:---|
| 読み | ドゥー ナッ(ト) チェインジ ザ ノンテス(ト) パート（プロダクション コウド）バイ イーヴン ワン ライン |
| つながり | なし（単語ごとに区切って読む） |
| JP | テスト以外の部分（本番のコード）は、1 行も変更しないでください。 |

| EN | Do not change‿existing tests (add‿only). |
|:---|:---|
| 読み | ドゥー ナッ(ト) チェイン‿ジグズィスティン テスツ（ア‿ドウンリー） |
| つながり | change‿existing（子音＋母音） ／ add‿only（子音＋母音） |
| JP | 既存のテストは変更しないでください（追加のみ）。 |

## [Write‿two kinds‿of tests]（テストは 2 種類書く）

読み: ライ‿トゥー カイン‿ゾヴ テスツ ／ つながり: Write‿two（同じ・似た子音が続く（前の音は言わない）） ／ kinds‿of（子音＋母音）

| EN | A. Tests for the new spec |
|:---|:---|
| 読み | エー テスツ フォー ザ ニュー スペック |
| つながり | なし（単語ごとに区切って読む） |
| JP | A. 新しい仕様のテスト |

| EN | They check the behavior‿in the spec. |
|:---|:---|
| 読み | ゼイ チェック ザ ビヘイヴィア‿リン ザ スペック |
| つながり | behavior‿in（r＋母音） |
| JP | 仕様に書かれた振る舞いを確かめるテストです。 |

| EN | It‿is not‿implemented yet, so it‿is correct for them to fail when run. |
|:---|:---|
| 読み | イ‿リズ ナ‿リンプリメンティッ(ド) イェッ(ト)、ソウ イ‿リズ コレク(ト) フォー ゼム トゥ フェイル ウェン ラン |
| つながり | It‿is（t＋母音（t がラ行に近い音になる）） ／ not‿implemented（t＋母音（t がラ行に近い音になる）） ／ it‿is（t＋母音（t がラ行に近い音になる）） |
| JP | まだ実装されていないので、実行すると失敗するのが正しい状態です。 |

| EN | Even‿if they fail, do not fix the production code‿to make them pass. |
|:---|:---|
| 読み | イーヴ‿ニフ ゼイ フェイル、ドゥー ナッ(ト) フィックス ザ プロダクション コウ‿トゥ メイク ゼム パス |
| つながり | Even‿if（子音＋母音） ／ code‿to（同じ・似た子音が続く（前の音は言わない）） |
| JP | 失敗しても、通すために本番のコードを直さないでください。 |

| EN | Only confirm that the reason for the failure‿is "not‿implemented yet". |
|:---|:---|
| 読み | オウンリー コンファーム ザッ(ト) ザ リーズン フォー ザ フェイリャ‿リズ "ナ‿リンプリメンティッ(ド) イェッ(ト)" |
| つながり | failure‿is（r＋母音） ／ not‿implemented（t＋母音（t がラ行に近い音になる）） |
| JP | 失敗の理由が「まだ実装されていないため」であることだけ確認してください。 |

| EN | Mark‿each test‿as not‿implemented: |
|:---|:---|
| 読み | マー‿キーチ テス‿タズ ナ‿リンプリメンティッ(ド) |
| つながり | Mark‿each（子音＋母音） ／ test‿as（t＋母音（t がラ行に近い音になる）） ／ not‿implemented（t＋母音（t がラ行に近い音になる）） |
| JP | 各テストに「未実装」の印を付けてください: |

| EN | B. Tests that protect‿existing behavior (regression check) |
|:---|:---|
| 読み | ビー テスツ ザッ(ト) プロテク‿ティグズィスティン ビヘイヴィアー（リグレッション チェック） |
| つながり | protect‿existing（t＋母音（t がラ行に近い音になる）） |
| JP | B. 既存の動作を守るテスト（デグレの確認） |

| EN | They check how the current production code behaves. |
|:---|:---|
| 読み | ゼイ チェック ハウ ザ カレン(ト) プロダクション コウド ビヘイヴズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 今の本番のコードがどう動くかを確かめるテストです。 |

| EN | They must pass with the current code. |
|:---|:---|
| 読み | ゼイ マス(ト) パス ウィズ ザ カレン(ト) コウド |
| つながり | なし（単語ごとに区切って読む） |
| JP | 今のコードで成功する必要があります。 |

| EN | Cover the behavior that must not change, in the places this change‿is likely to affect. |
|:---|:---|
| 読み | カヴァー ザ ビヘイヴィアー ザッ(ト) マス(ト) ナッ(ト) チェインジ、イン ザ プレイスィズ ディス チェイン‿ジズ ライクリー トゥ アフェクト |
| つながり | change‿is（子音＋母音） |
| JP | 今回の修正が影響しそうな場所で、変えてはいけない振る舞いを対象にしてください。 |

## [How to proceed]（進め方）

読み: ハウ トゥ プロスィード ／ つながり: なし（単語ごとに区切って読む）

| EN | First, run‿all‿existing tests‿and record the result (to tell‿apart‿tests that were‿already failing). |
|:---|:---|
| 読み | ファースト、ラ‿ノー‿リグズィスティン テス‿ツァン(ド) リコー(ド) ザ リザルト（トゥ テ‿ラパー‿テスツ ザッ(ト) ワ‿ロールレディ フェイリン） |
| つながり | run‿all（子音＋母音） ／ all‿existing（子音＋母音） ／ tests‿and（子音＋母音） ／ tell‿apart（子音＋母音） ／ apart‿tests（同じ・似た子音が続く（前の音は言わない）） ／ were‿already（r＋母音） |
| JP | まず、既存のテストをすべて実行して、結果を記録してください（元から失敗していたテストと区別するため）。 |

| EN | Before writing tests, show me the list‿of tests you will write (A and B), and wait for my OK. |
|:---|:---|
| 読み | ビフォー ライティン テスツ、ショウ ミー ザ リス‿トヴ テスツ ユー ウィル ライ(ト)（エー アン(ド) ビー）、アン(ド) ウェイ(ト) フォー マイ オウケイ |
| つながり | list‿of（t＋母音（t がラ行に近い音になる）） |
| JP | テストを書く前に、書くテストの一覧（A と B）を見せて、私の OK を待ってください。 |

| EN | After writing them, run‿all tests‿and report the result separately for‿A and B. |
|:---|:---|
| 読み | アフター ライティン ゼム、ラ‿ノール テス‿ツァン(ド) リポー(ト) ザ リザル(ト) セパレッ(ト)リー フォ‿レイ アン(ド) ビー |
| つながり | run‿all（子音＋母音） ／ tests‿and（子音＋母音） ／ for‿A（r＋母音） |
| JP | 書いたあと、すべてのテストを実行して、A と B に分けて結果を報告してください。 |

| EN | Expected: A fails (or‿is‿skipped), B passes. |
|:---|:---|
| 読み | イクスペクティッ(ド)：エー フェイルズ（オ‿リ‿スキップト）、ビー パスィズ |
| つながり | or‿is（r＋母音） ／ is‿skipped（同じ・似た子音が続く（前の音は言わない）） |
| JP | 期待される結果: A は失敗（またはスキップ）、B は成功。 |

| EN | If‿a result‿differs from this, explain why. |
|:---|:---|
| 読み | イ‿ファ リザル‿ディファーズ フロム ディス、イクスプレイン ワイ |
| つながり | If‿a（子音＋母音） ／ result‿differs（同じ・似た子音が続く（前の音は言わない）） |
| JP | 結果がこれと違うときは、理由を説明してください。 |

| EN | At the end, show with git‿diff that‿you did not change the production code. |
|:---|:---|
| 読み | アッ(ト) ジ エンド、ショウ ウィズ ギッ‿ディフ ザッ‿チュー ディッ(ド) ナッ(ト) チェインジ ザ プロダクション コウド |
| つながり | git‿diff（同じ・似た子音が続く（前の音は言わない）） ／ that‿you（t＋you（チュ）） |
| JP | 最後に、本番のコードを変更していないことを git diff で示してください。 |

## [Rules for writing]（書き方のルール）

読み: ルールズ フォー ライティング ／ つながり: なし（単語ごとに区切って読む）

| EN | Follow the location‿and style‿of the existing tests. |
|:---|:---|
| 読み | フォロウ ザ ロウケイショ‿ナン(ド) スタイ‿ロヴ ジ イグズィスティン テスツ |
| つながり | location‿and（子音＋母音） ／ style‿of（子音＋母音） |
| JP | 既存のテストの置き場所と書き方に合わせてください。 |

| EN | Give‿each test‿a name that says what‿it checks. |
|:---|:---|
| 読み | ギ‿ヴィーチ テス‿タ ネイム ザッ(ト) セズ ワ‿リッ(ト) チェックス |
| つながり | Give‿each（子音＋母音） ／ test‿a（t＋母音（t がラ行に近い音になる）） ／ what‿it（t＋母音（t がラ行に近い音になる）） |
| JP | 各テストに、何を確かめるかが分かる名前を付けてください。 |

| EN | Include normal cases, boundary values (zero items, empty, maximum), and‿error cases. |
|:---|:---|
| 読み | インクルード ノーマル ケイスィズ、バウンダリー ヴァリューズ（ズィロウ アイテムズ、エンプティ、マクスィマム）、アン‿デラー ケイスィズ |
| つながり | and‿error（子音＋母音） |
| JP | 正常系、境界値（0 件、空、最大値）、異常系を含めてください。 |

| EN | Do not weaken‿expected values‿or delete‿tests to make them pass. |
|:---|:---|
| 読み | ドゥー ナッ(ト) ウィーク‿ニクスペクティッ(ド) ヴァリュー‿ゾア ディリー‿テスツ トゥ メイク ゼム パス |
| つながり | weaken‿expected（子音＋母音） ／ values‿or（子音＋母音） ／ delete‿tests（同じ・似た子音が続く（前の音は言わない）） |
| JP | 通すために、期待値を弱めたり、テストを削除したりしないでください。 |

---

## この指示文の難しい単語（15 語）

[boundary value](words.md#boundary-value) ／ [confirm](words.md#confirm) ／ [cover](words.md#cover) ／ [differ](words.md#differ) ／ [expected value](words.md#expected-value) ／ [implemented](words.md#implemented) ／ [mark](words.md#mark) ／ [production](words.md#production) ／ [production code](words.md#production-code) ／ [protect](words.md#protect) ／ [record](words.md#record) ／ [regression](words.md#regression) ／ [separately](words.md#separately) ／ [skip](words.md#skip) ／ [weaken](words.md#weaken)
