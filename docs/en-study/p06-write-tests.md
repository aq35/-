# 英語の学習 6. テストコードを書く

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 6 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Write test code based on what I want to do this time. |
|:---|:---|
| 読み | ライ(ト) テスト コウド ベイスト オン ワッ(ト) アイ ウォン トゥ ドゥー ディス タイム |
| JP | 今回やりたいことをもとに、テストコードを書いてください。 |

## [What I want to do]（やりたいこと）

読み: ワッ(ト) アイ ウォン(ト) トゥ ドゥー

| EN | The path of the spec file (e.g. docs/spec/xxx-next.md), or write it directly here |
|:---|:---|
| 読み | ザ パス オヴ ザ スペック ファイル（イー ジー ドックス スペック エックス エックス エックス ネクスト ドッ(ト) エムディー）、オア ライ(ト) イッ(ト) ダイレクトリー ヒア |
| JP | 仕様ファイルのパス（例: docs/spec/xxx-next.md）、またはここに直接書いてください。 |

## [What you may change]（変更してよいもの）

読み: ワッ(ト) ユー メイ チェインジ

| EN | Test code only (test files, or the test part inside the same file). |
|:---|:---|
| 読み | テスト コウド オウンリー（テスト ファイルズ、オア ザ テスト パーティン サイド ザ セイム ファイル） |
| JP | テスト用のコードだけです（テストファイル、または同じファイルの中のテスト部分）。 |

| EN | Do not change the non-test part (production code) by even one line. |
|:---|:---|
| 読み | ドゥー ノッ(ト) チェインジ ザ ノンテスト パート（プロダクション コウド）バイ イーヴン ワン ライン |
| JP | テスト以外の部分（本番のコード）は、1 行も変更しないでください。 |

| EN | Do not change existing tests (add only). |
|:---|:---|
| 読み | ドゥー ノッ(ト) チェインジ イグズィスティン テスツ（アッド オウンリー） |
| JP | 既存のテストは変更しないでください（追加のみ）。 |

## [Write two kinds of tests]（テストは 2 種類書く）

読み: ライ(ト) トゥー カインズ オヴ テスツ

| EN | A. Tests for the new spec |
|:---|:---|
| 読み | エー テスツ フォー ザ ニュー スペック |
| JP | A. 新しい仕様のテスト |

| EN | They check the behavior in the spec. |
|:---|:---|
| 読み | ゼイ チェック ザ ビヘイヴィアー イン ザ スペック |
| JP | 仕様に書かれた振る舞いを確かめるテストです。 |

| EN | It is not implemented yet, so it is correct for them to fail when run. |
|:---|:---|
| 読み | イッ(ト) イズ ノッ(ト) インプリメンティッ(ド) イェッ(ト)、ソウ イッ(ト) イズ コレクト フォー ゼム トゥ フェイル ウェン ラン |
| JP | まだ実装されていないので、実行すると失敗するのが正しい状態です。 |

| EN | Even if they fail, do not fix the production code to make them pass. |
|:---|:---|
| 読み | イーヴン イフ ゼイ フェイル、ドゥー ノッ(ト) フィックス ザ プロダクション コウド トゥ メイク ゼム パス |
| JP | 失敗しても、通すために本番のコードを直さないでください。 |

| EN | Only confirm that the reason for the failure is "not implemented yet". |
|:---|:---|
| 読み | オウンリー コンファーム ザッ(ト) ザ リーズン フォー ザ フェイリャー イズ "ノッ(ト) インプリメンティッ(ド) イェッ(ト)" |
| JP | 失敗の理由が「まだ実装されていないため」であることだけ確認してください。 |

| EN | Mark each test as not implemented: |
|:---|:---|
| 読み | マーク イーチ テスト アズ ノッ(ト) インプリメンティッ(ド) |
| JP | 各テストに「未実装」の印を付けてください: |

| EN | B. Tests that protect existing behavior (regression check) |
|:---|:---|
| 読み | ビー テスツ ザッ(ト) プロテクト イグズィスティン ビヘイヴィアー（リグレッション チェック） |
| JP | B. 既存の動作を守るテスト（デグレの確認） |

| EN | They check how the current production code behaves. |
|:---|:---|
| 読み | ゼイ チェック ハウ ザ カレン(ト) プロダクション コウド ビヘイヴズ |
| JP | 今の本番のコードがどう動くかを確かめるテストです。 |

| EN | They must pass with the current code. |
|:---|:---|
| 読み | ゼイ マスト パス ウィズ ザ カレン(ト) コウド |
| JP | 今のコードで成功する必要があります。 |

| EN | Cover the behavior that must not change, in the places this change is likely to affect. |
|:---|:---|
| 読み | カヴァー ザ ビヘイヴィアー ザッ(ト) マスト ナッ(ト) チェインジ、イン ザ プレイスィズ ディス チェインジ イズ ライクリー トゥ アフェクト |
| JP | 今回の修正が影響しそうな場所で、変えてはいけない振る舞いを対象にしてください。 |

## [How to proceed]（進め方）

読み: ハウ トゥ プロスィード

| EN | First, run all existing tests and record the result (to tell apart tests that were already failing). |
|:---|:---|
| 読み | ファースト、ラン オール イグズィスティン テスツ アン(ド) レコー(ド) ザ リザルト（トゥ テル アパート テスツ ザッ(ト) ワー オールレディ フェイリン） |
| JP | まず、既存のテストをすべて実行して、結果を記録してください（元から失敗していたテストと区別するため）。 |

| EN | Before writing tests, show me the list of tests you will write (A and B), and wait for my OK. |
|:---|:---|
| 読み | ビフォー ライティン テスツ、ショウ ミー ザ リスト オヴ テスツ ユー ウィル ライ(ト)（エー アン(ド) ビー）、アン(ド) ウェイ(ト) フォー マイ オーケイ |
| JP | テストを書く前に、書くテストの一覧（A と B）を見せて、私の OK を待ってください。 |

| EN | After writing them, run all tests and report the result separately for A and B. |
|:---|:---|
| 読み | アフター ライティン ゼム、ラン オール テスツ アン(ド) リポー(ト) ザ リザルト セパレッ(ト)リー フォー エー アン(ド) ビー |
| JP | 書いたあと、すべてのテストを実行して、A と B に分けて結果を報告してください。 |

| EN | Expected: A fails (or is skipped), B passes. |
|:---|:---|
| 読み | イクスペクティッ(ド)：エー フェイルズ（オア イズ スキップト）、ビー パスィズ |
| JP | 期待される結果: A は失敗（またはスキップ）、B は成功。 |

| EN | If a result differs from this, explain why. |
|:---|:---|
| 読み | イフ ア リザルト ディファーズ フロム ディス、イクスプレイン ワイ |
| JP | 結果がこれと違うときは、理由を説明してください。 |

| EN | At the end, show with git diff that you did not change the production code. |
|:---|:---|
| 読み | アッ(ト) ジ エンド、ショウ ウィズ ギッ(ト) ディフ ザッ(ト) ユー ディドゥン(ト) チェインジ ザ プロダクション コウド |
| JP | 最後に、本番のコードを変更していないことを git diff で示してください。 |

## [Rules for writing]（書き方のルール）

読み: ルールズ フォー ライティング

| EN | Follow the location and style of the existing tests. |
|:---|:---|
| 読み | フォロウ ザ ロウケイション アン(ド) スタイル オヴ ジ イグズィスティン テスツ |
| JP | 既存のテストの置き場所と書き方に合わせてください。 |

| EN | Give each test a name that says what it checks. |
|:---|:---|
| 読み | ギヴ イーチ テスト ア ネイム ザッ(ト) セズ ワッ(ト) イッ(ト) チェックス |
| JP | 各テストに、何を確かめるかが分かる名前を付けてください。 |

| EN | Include normal cases, boundary values (zero items, empty, maximum), and error cases. |
|:---|:---|
| 読み | インクルード ノーマル ケイスィズ、バウンダリー ヴァリューズ（ズィロウ アイテムズ、エンプティ、マクスィマム）、アン(ド) エラー ケイスィズ |
| JP | 正常系、境界値（0 件、空、最大値）、異常系を含めてください。 |

| EN | Do not weaken expected values or delete tests to make them pass. |
|:---|:---|
| 読み | ドゥー ノッ(ト) ウィークン イクスペクティッ(ド) ヴァリューズ オア ディリー(ト) テスツ トゥ メイク ゼム パス |
| JP | 通すために、期待値を弱めたり、テストを削除したりしないでください。 |

---

## この指示文の難しい単語（15 語）

[boundary value](words.md#boundary-value) ／ [confirm](words.md#confirm) ／ [cover](words.md#cover) ／ [differ](words.md#differ) ／ [expected value](words.md#expected-value) ／ [implemented](words.md#implemented) ／ [mark](words.md#mark) ／ [production](words.md#production) ／ [production code](words.md#production-code) ／ [protect](words.md#protect) ／ [record](words.md#record) ／ [regression](words.md#regression) ／ [separately](words.md#separately) ／ [skip](words.md#skip) ／ [weaken](words.md#weaken)
