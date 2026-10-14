# 英語の学習 10. 完了前のセルフチェック

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 10 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Before finishing, check whether the changes‿stay within the scope‿of the request. |
|:---|:---|
| 読み | ビフォー フィニッシン、チェック ウェザー ザ チェインジ‿ステイ ウィズイン ザ スコウ‿ポヴ ザ リクウェスト |
| つながり | changes‿stay（同じ・似た子音が続く（前の音は言わない）） ／ scope‿of（子音＋母音） |
| JP | 終わる前に、変更が依頼の範囲に収まっているか確認してください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ナッ(ト) マディファイ エニィ コウド |
| つながり | なし（単語ごとに区切って読む） |
| JP | コードは変更しないでください。 |

## [What to check]（確認すること）

読み: ワッ(ト) トゥ チェック

| EN | Show the list‿of changed files with git status‿and git‿diff --stat. |
|:---|:---|
| 読み | ショウ ザ リス‿トヴ チェインジ(ド) ファイルズ ウィズ ギッ(ト) ステイタ‿サン(ド) ギッ‿ディフ スタッ(ト) |
| つながり | list‿of（t＋母音（t がラ行に近い音になる）） ／ status‿and（子音＋母音） ／ git‿diff（同じ・似た子音が続く（前の音は言わない）） |
| JP | git status と git diff --stat で、変更したファイルの一覧を示してください。 |

| EN | Check for changes‿unrelated‿to the request (formatting-only changes, unrelated files, generated files, configuration files, changes to the commit‿a submodule points to). |
|:---|:---|
| 読み | チェック フォー チェインジ‿ザンリレイティッ‿トゥ ザ リクウェスト（フォーマティン オウンリー チェインジズ、アンリレイティッ(ド) ファイルズ、ジェネレイティッ(ド) ファイルズ、コンフィギュレイション ファイルズ、チェインジズ トゥ ザ カミッ‿ラ サブモジュール ポインツ トゥ） |
| つながり | changes‿unrelated（子音＋母音） ／ unrelated‿to（同じ・似た子音が続く（前の音は言わない）） ／ commit‿a（t＋母音（t がラ行に近い音になる）） |
| JP | 依頼と関係のない変更がないか確認してください（整形だけの変更、無関係なファイル、生成物、設定ファイル、サブモジュールの指すコミットの変更）。 |

| EN | Check for leftovers (debug‿output, temporary commented-out code, TODOs, skipped‿tests, secrets). |
|:---|:---|
| 読み | チェック フォー レフトオウヴァーズ（ディバッ‿ガウトプッ(ト)、テンポラリー コメンティダウ(ト) コウド、トゥードゥーズ、スキップ‿テスツ、スィークレッツ） |
| つながり | debug‿output（子音＋母音） ／ skipped‿tests（同じ・似た子音が続く（前の音は言わない）） |
| JP | 消し忘れがないか確認してください（デバッグ出力、一時的なコメントアウト、TODO、スキップしたテスト、秘密情報）。 |

| EN | Check whether‿anything‿I asked for has not been done. |
|:---|:---|
| 読み | チェック ウェザ‿レニスィン‿ガイ アスク(ト) フォー ハズ ナッ(ト) ビーン ダン |
| つながり | whether‿anything（r＋母音） ／ anything‿I（子音＋母音） |
| JP | 私が頼んだことで、まだやっていないことがないか確認してください。 |

| EN | Check that the quality check‿in 7 (formatter, linter, tests) is‿all passing. |
|:---|:---|
| 読み | チェック ザッ(ト) ザ クオリティ チェッ‿キン セヴン（フォーマッター、リンター、テスツ）イ‿ゾール パスィン |
| つながり | check‿in（子音＋母音） ／ is‿all（子音＋母音） |
| JP | 7 の品質チェック（フォーマッター・lint・テスト）が、すべて成功していることを確認してください。 |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | Mark‿each check‿as "OK / needs‿action". |
|:---|:---|
| 読み | マー‿キーチ チェッ‿カズ "オウケイ / ニー‿ザクション" |
| つながり | Mark‿each（子音＋母音） ／ check‿as（子音＋母音） ／ needs‿action（子音＋母音） |
| JP | 各チェックに「OK / 要対応」を付けてください。 |

| EN | For "needs‿action", give the file‿and line. |
|:---|:---|
| 読み | フォー "ニー‿ザクション"、ギヴ ザ ファイ‿ラン(ド) ライン |
| つながり | needs‿action（子音＋母音） ／ file‿and（子音＋母音） |
| JP | 「要対応」には、ファイルと行を書いてください。 |

---

## この指示文の難しい単語（8 語）

[commented-out](words.md#commented-out) ／ [formatting-only](words.md#formatting-only) ／ [generated code](words.md#generated-code) ／ [leftover](words.md#leftover) ／ [mark](words.md#mark) ／ [scope](words.md#scope) ／ [secret](words.md#secret) ／ [unrelated](words.md#unrelated)
