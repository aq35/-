# 英語の学習 7. フォーマッター・lint・テストを実行する

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 7 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## 依頼の概要

| EN | Run the formatter, the linter, and the tests, and report the results. |
|:---|:---|
| 読み | ラン ザ フォーマッター、ザ リンター、アン(ド) ザ テスツ、アン(ド) リポー(ト) ザ リザルツ |
| JP | フォーマッター、lint、テストを実行して、結果を報告してください。 |

## [How to find the commands]（コマンドの見つけ方）

読み: ハウ トゥ ファインド ザ コマンズ

| EN | Find this project's commands in this order. |
|:---|:---|
| 読み | ファインド ディス プロジェクツ コマンズ イン ディス オーダー |
| JP | このプロジェクトのコマンドを、この順で探してください。 |

| EN | When you find them, tell me which file they were in. |
|:---|:---|
| 読み | ウェン ユー ファインド ゼム、テル ミー ウィッチ ファイル ゼイ ワー イン |
| JP | 見つけたら、どのファイルにあったかを教えてください。 |

| EN | Commands written in the CI configuration |
|:---|:---|
| 読み | コマンズ リトゥン イン ザ スィーアイ コンフィギュレイション |
| JP | CI の設定に書かれているコマンド |

| EN | treat this as the source of truth |
|:---|:---|
| 読み | トリート ディス アズ ザ ソース オヴ トゥルース |
| JP | これを正（基準）として扱ってください |

| EN | Task runners and documents: justfile, Makefile, scripts in package.json, CLAUDE.md, README, CONTRIBUTING |
|:---|:---|
| 読み | タスク ランナーズ アン(ド) ドキュメンツ：ジャストファイル、メイクファイル、スクリプツ イン パッケージ ジェイソン、クロード エムディー、リードミー、コントリビューティング |
| JP | タスクランナーと文書: justfile、Makefile、package.json の scripts、CLAUDE.md、README、CONTRIBUTING |

| EN | If neither has them, the standard commands of the language |
|:---|:---|
| 読み | イフ ナイザー ハズ ゼム、ザ スタンダード コマンズ オヴ ザ ラングイッジ |
| JP | どちらにもなければ、その言語の標準のコマンド |

| EN | If the CI and a local setup use different commands, use the CI ones. |
|:---|:---|
| 読み | イフ ザ スィーアイ アン(ド) ア ロウカル セッタップ ユーズ ディファレン(ト) コマンズ、ユーズ ザ スィーアイ ワンズ |
| JP | CI と手元で使うコマンドが違うときは、CI のものを使ってください。 |

## [Steps]（手順）

読み: ステップス

| EN | Before the changes (the baseline state), run the three and record the results. |
|:---|:---|
| 読み | ビフォー ザ チェインジズ（ザ ベイスライン ステイ(ト)）、ラン ザ スリー アン(ド) レコー(ド) ザ リザルツ |
| JP | 変更の前（基準の状態）に、3 つを実行して、結果を記録してください。 |

| EN | If changes are already made, do not touch my working directory. |
|:---|:---|
| 読み | イフ チェインジズ アー オールレディ メイド、ドゥー ノッ(ト) タッチ マイ ワーキン ディレクトリー |
| JP | すでに変更してあるときは、私の作業ディレクトリに触らないでください。 |

| EN | Create the pre-change state in another place and run it there: |
|:---|:---|
| 読み | クリエイ(ト) ザ プリチェインジ ステイ(ト) イン アナザー プレイス アン(ド) ラン イッ(ト) ゼア |
| JP | 変更前の状態を別の場所に作って、そこで実行してください: |

| EN | After the changes, run the same three. |
|:---|:---|
| 読み | アフター ザ チェインジズ、ラン ザ セイム スリー |
| JP | 変更のあとに、同じ 3 つを実行してください。 |

| EN | Handle failures by these rules: |
|:---|:---|
| 読み | ハンドル フェイリャーズ バイ ズィーズ ルールズ |
| JP | 失敗は、次のルールで扱ってください: |

| EN | Failures caused by this change (those that passed in the baseline): fix them. |
|:---|:---|
| 読み | フェイリャーズ コーズド バイ ディス チェインジ（ゾウズ ザッ(ト) パスト イン ザ ベイスライン）：フィックス ゼム |
| JP | 今回の変更が原因の失敗（基準の状態では成功していたもの）: 直してください。 |

| EN | Failures that were already there in the baseline: do not fix them. |
|:---|:---|
| 読み | フェイリャーズ ザッ(ト) ワー オールレディ ゼア イン ザ ベイスライン：ドゥー ノッ(ト) フィックス ゼム |
| JP | 基準の状態から失敗していたもの: 直さないでください。 |

| EN | List them in the report. |
|:---|:---|
| 読み | リス(ト) ゼム イン ザ リポー(ト) |
| JP | 報告に一覧にしてください。 |

| EN | Formatter findings: you may fix them with the automatic formatter. |
|:---|:---|
| 読み | フォーマッター ファインディングズ：ユー メイ フィックス ゼム ウィズ ジ オートマティック フォーマッター |
| JP | フォーマッターの指摘: 自動整形で直してかまいません。 |

| EN | But if files unrelated to this change get reformatted, revert those files and tell me. |
|:---|:---|
| 読み | バッ(ト) イフ ファイルズ アンリレイティッ(ド) トゥ ディス チェインジ ゲッ(ト) リーフォーマッティッド、リヴァー(ト) ゾウズ ファイルズ アン(ド) テル ミー |
| JP | ただし、今回の変更と関係のないファイルまで整形されたときは、そのファイルを元に戻して、私に伝えてください。 |

| EN | After fixing, run the three again and report the results. |
|:---|:---|
| 読み | アフター フィクスィン、ラン ザ スリー アゲイン アン(ド) リポー(ト) ザ リザルツ |
| JP | 直したあと、3 つをもう一度実行して、結果を報告してください。 |

## [Do not]（やってはいけないこと）

読み: ドゥー ノッ(ト)

| EN | Silence lint warnings by disabling them |
|:---|:---|
| 読み | サイレンス リン(ト) ウォーニングズ バイ ディセイブリン ゼム |
| JP | 無効化して、lint の警告を黙らせること |

| EN | Delete tests, skip tests, or rewrite expected values |
|:---|:---|
| 読み | ディリー(ト) テスツ、スキップ テスツ、オア ライ(ト) イクスペクティッ(ド) ヴァリューズ |
| JP | テストを削除する、スキップする、期待値を書き換えること |

| EN | Lower the strictness of a command to make it pass (for example, removing the option that turns warnings into errors) |
|:---|:---|
| 読み | ロウワー ザ ストリクトネス オヴ ア コマンド トゥ メイク イッ(ト) パス（フォー イグザンプル、リムーヴィン ジ オプション ザッ(ト) ターンズ ウォーニングズ イントゥ エラーズ） |
| JP | 通すために、コマンドの厳しさを下げること（例: 警告をエラーにするオプションを外す） |

| EN | If you think one of these is necessary, do not do it. Explain why and ask me. |
|:---|:---|
| 読み | イフ ユー スィンク ワン オヴ ズィーズ イズ ネセサリー、ドゥー ノッ(ト) ドゥー イッ(ト)。イクスプレイン ワイ アン(ド) アスク ミー |
| JP | これらのどれかが必要だと思ったときは、実行せず、理由を説明して私に聞いてください。 |

---

## この指示文の難しい単語（12 語）

[baseline](words.md#baseline) ／ [disable](words.md#disable) ／ [expected value](words.md#expected-value) ／ [record](words.md#record) ／ [reformat](words.md#reformat) ／ [revert](words.md#revert) ／ [silence](words.md#silence) ／ [skip](words.md#skip) ／ [source of truth](words.md#source-of-truth) ／ [strictness](words.md#strictness) ／ [task runner](words.md#task-runner) ／ [unrelated](words.md#unrelated)
