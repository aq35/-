# 英語の学習 10. 完了前のセルフチェック

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 10 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Before finishing, check whether the changes stay within the scope of the request. |
|:---|:---|
| 読み | ビフォー フィニッシン、チェック ウェザー ザ チェインジズ ステイ ウィズイン ザ スコウプ オヴ ザ リクウェスト |
| JP | 終わる前に、変更が依頼の範囲に収まっているか確認してください。 |

| EN | Do not modify any code. |
|:---|:---|
| 読み | ドゥー ノッ(ト) マディファイ エニィ コウド |
| JP | コードは変更しないでください。 |

## [What to check]（確認すること）

読み: ワッ(ト) トゥ チェック

| EN | Show the list of changed files with git status and git diff --stat. |
|:---|:---|
| 読み | ショウ ザ リスト オヴ チェインジ(ド) ファイルズ ウィズ ギッ(ト) ステイタス アン(ド) ギッ(ト) ディフ スタッ(ト) |
| JP | git status と git diff --stat で、変更したファイルの一覧を示してください。 |

| EN | Check for changes unrelated to the request (formatting-only changes, unrelated files, generated files, configuration files, changes to the commit a submodule points to). |
|:---|:---|
| 読み | チェック フォー チェインジズ アンリレイティッ(ド) トゥ ザ リクウェスト（フォーマティン オウンリー チェインジズ、アンリレイティッ(ド) ファイルズ、ジェネレイティッ(ド) ファイルズ、コンフィギュレイション ファイルズ、チェインジズ トゥ ザ カミッ(ト) ア サブモジュール ポインツ トゥ） |
| JP | 依頼と関係のない変更がないか確認してください（整形だけの変更、無関係なファイル、生成物、設定ファイル、サブモジュールの指すコミットの変更）。 |

| EN | Check for leftovers (debug output, temporary commented-out code, TODOs, skipped tests, secrets). |
|:---|:---|
| 読み | チェック フォー レフトオーヴァーズ（ディバッグ アウトプッ(ト)、テンポラリー コメンティッ ダウト コウド、トゥードゥーズ、スキップト テスツ、スィークレッツ） |
| JP | 消し忘れがないか確認してください（デバッグ出力、一時的なコメントアウト、TODO、スキップしたテスト、秘密情報）。 |

| EN | Check whether anything I asked for has not been done. |
|:---|:---|
| 読み | チェック ウェザー エニスィング アイ アスクト フォー ハズ ナッ(ト) ビーン ダン |
| JP | 私が頼んだことで、まだやっていないことがないか確認してください。 |

| EN | Check that the quality check in 7 (formatter, linter, tests) is all passing. |
|:---|:---|
| 読み | チェック ザッ(ト) ザ クオリティ チェック イン セヴン（フォーマッター、リンター、テスツ）イズ オール パスィン |
| JP | 7 の品質チェック（フォーマッター・lint・テスト）が、すべて成功していることを確認してください。 |

## [Output]（出力）

読み: アウトプッ(ト)

| EN | Mark each check as "OK / needs action". |
|:---|:---|
| 読み | マーク イーチ チェック アズ "オーケイ / ニーズ アクション" |
| JP | 各チェックに「OK / 要対応」を付けてください。 |

| EN | For "needs action", give the file and line. |
|:---|:---|
| 読み | フォー "ニーズ アクション"、ギヴ ザ ファイル アン(ド) ライン |
| JP | 「要対応」には、ファイルと行を書いてください。 |

---

## この指示文の難しい単語（8 語）

[commented-out](words.md#commented-out) ／ [formatting-only](words.md#formatting-only) ／ [generated code](words.md#generated-code) ／ [leftover](words.md#leftover) ／ [mark](words.md#mark) ／ [scope](words.md#scope) ／ [secret](words.md#secret) ／ [unrelated](words.md#unrelated)
