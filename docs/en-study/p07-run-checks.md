# 英語の学習 7. フォーマッター・lint・テストを実行する

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 7 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## 依頼の概要

| EN | Run the formatter, the linter, and the tests, and report the results. |
|:---|:---|
| 読み | ラン ザ フォーマッター、ザ リンター、アン(ド) ザ テスツ、アン(ド) リポー(ト) ザ リザルツ |
| つながり | なし（単語ごとに区切って読む） |
| JP | フォーマッター、lint、テストを実行して、結果を報告してください。 |

## [How to find the commands]（コマンドの見つけ方）

読み: ハウ トゥ ファインド ザ コマンズ ／ つながり: なし（単語ごとに区切って読む）

| EN | Find this project's commands‿in this‿order. |
|:---|:---|
| 読み | ファイン(ド) ディス プロジェクツ コマン‿ズィン ディ‿ソーダー |
| つながり | commands‿in（子音＋母音） ／ this‿order（子音＋母音） |
| JP | このプロジェクトのコマンドを、この順で探してください。 |

| EN | When you find them, tell me which file they were‿in. |
|:---|:---|
| 読み | ウェン ユー ファイン(ド) ゼム、テル ミー ウィッチ ファイル ゼイ ワ‿リン |
| つながり | were‿in（r＋母音） |
| JP | 見つけたら、どのファイルにあったかを教えてください。 |

| EN | Commands written‿in the CI configuration |
|:---|:---|
| 読み | コマンズ リトゥ‿ニン ザ スィーアイ コンフィギュレイション |
| つながり | written‿in（子音＋母音） |
| JP | CI の設定に書かれているコマンド |

| EN | treat this‿as the source‿of truth |
|:---|:---|
| 読み | トリー(ト) ディ‿サズ ザ ソー‿ソヴ トゥルース |
| つながり | this‿as（子音＋母音） ／ source‿of（子音＋母音） |
| JP | これを正（基準）として扱ってください |

| EN | Task runners‿and‿documents: justfile, Makefile, scripts‿in package.json, CLAUDE.md, README, CONTRIBUTING |
|:---|:---|
| 読み | タスク ランナー‿ザン‿ドキュメンツ：ジャストファイル、メイクファイル、スクリプ‿ツィン パッケージ ジェイソン、クロード エムディー、リードミー、コントリビューティング |
| つながり | runners‿and（子音＋母音） ／ and‿documents（同じ・似た子音が続く（前の音は言わない）） ／ scripts‿in（子音＋母音） |
| JP | タスクランナーと文書: justfile、Makefile、package.json の scripts、CLAUDE.md、README、CONTRIBUTING |

| EN | If neither has them, the standard commands‿of the language |
|:---|:---|
| 読み | イフ ナイザー ハズ ゼム、ザ スタンダード コマン‿ゾヴ ザ ラングイッジ |
| つながり | commands‿of（子音＋母音） |
| JP | どちらにもなければ、その言語の標準のコマンド |

| EN | If the CI and‿a local setup use different commands, use the CI ones. |
|:---|:---|
| 読み | イフ ザ スィーアイ アン‿ダ ロウカル セッタップ ユーズ ディファレン(ト) コマンズ、ユーズ ザ スィーアイ ワンズ |
| つながり | and‿a（子音＋母音） |
| JP | CI と手元で使うコマンドが違うときは、CI のものを使ってください。 |

## [Steps]（手順）

読み: ステップス ／ つながり: なし（単語ごとに区切って読む）

| EN | Before the changes (the baseline state), run the three and record the results. |
|:---|:---|
| 読み | ビフォー ザ チェインジズ（ザ ベイスライン ステイ(ト)）、ラン ザ スリー アン(ド) リコー(ド) ザ リザルツ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変更の前（基準の状態）に、3 つを実行して、結果を記録してください。 |

| EN | If changes‿are‿already made, do not‿touch my working directory. |
|:---|:---|
| 読み | イフ チェインジ‿ザ‿ロールレディ メイド、ドゥー ナッ‿タッチ マイ ワーキン ディレクトリー |
| つながり | changes‿are（子音＋母音） ／ are‿already（r＋母音） ／ not‿touch（同じ・似た子音が続く（前の音は言わない）） |
| JP | すでに変更してあるときは、私の作業ディレクトリに触らないでください。 |

| EN | Create the pre-change state‿in‿another place‿and run‿it there: |
|:---|:---|
| 読み | クリエイ(ト) ザ プリチェインジ ステイ‿リ‿ナナザー プレイ‿サン(ド) ラ‿ニッ(ト) ゼア |
| つながり | state‿in（t＋母音（t がラ行に近い音になる）） ／ in‿another（子音＋母音） ／ place‿and（子音＋母音） ／ run‿it（子音＋母音） |
| JP | 変更前の状態を別の場所に作って、そこで実行してください: |

| EN | After the changes, run the same three. |
|:---|:---|
| 読み | アフター ザ チェインジズ、ラン ザ セイム スリー |
| つながり | なし（単語ごとに区切って読む） |
| JP | 変更のあとに、同じ 3 つを実行してください。 |

| EN | Handle failures by these rules: |
|:---|:---|
| 読み | ハンドル フェイリャーズ バイ ズィーズ ルールズ |
| つながり | なし（単語ごとに区切って読む） |
| JP | 失敗は、次のルールで扱ってください: |

| EN | Failures caused by this change (those that passed‿in the baseline): fix them. |
|:---|:---|
| 読み | フェイリャーズ コーズ(ド) バイ ディス チェインジ（ゾウズ ザッ(ト) パス‿ティン ザ ベイスライン）：フィックス ゼム |
| つながり | passed‿in（子音＋母音） |
| JP | 今回の変更が原因の失敗（基準の状態では成功していたもの）: 直してください。 |

| EN | Failures that were‿already there‿in the baseline: do not fix them. |
|:---|:---|
| 読み | フェイリャーズ ザッ(ト) ワ‿ロールレディ ゼア‿リン ザ ベイスライン：ドゥー ナッ(ト) フィックス ゼム |
| つながり | were‿already（r＋母音） ／ there‿in（r＋母音） |
| JP | 基準の状態から失敗していたもの: 直さないでください。 |

| EN | List them‿in the report. |
|:---|:---|
| 読み | リス(ト) ゼ‿ミン ザ リポー(ト) |
| つながり | them‿in（子音＋母音） |
| JP | 報告に一覧にしてください。 |

| EN | Formatter findings: you may fix them with the automatic formatter. |
|:---|:---|
| 読み | フォーマッター ファインディングズ：ユー メイ フィックス ゼム ウィズ ジ オートマティック フォーマッター |
| つながり | なし（単語ごとに区切って読む） |
| JP | フォーマッターの指摘: 自動整形で直してかまいません。 |

| EN | But‿if‿files‿unrelated‿to this change get reformatted, revert those files‿and‿tell me. |
|:---|:---|
| 読み | バ‿リ‿ファイル‿ザンリレイティッ‿トゥ ディス チェインジ ゲッ(ト) リーフォーマッティッド、リヴァー(ト) ゾウズ ファイル‿ザン‿テル ミー |
| つながり | But‿if（t＋母音（t がラ行に近い音になる）） ／ if‿files（同じ・似た子音が続く（前の音は言わない）） ／ files‿unrelated（子音＋母音） ／ unrelated‿to（同じ・似た子音が続く（前の音は言わない）） ／ files‿and（子音＋母音） ／ and‿tell（同じ・似た子音が続く（前の音は言わない）） |
| JP | ただし、今回の変更と関係のないファイルまで整形されたときは、そのファイルを元に戻して、私に伝えてください。 |

| EN | After fixing, run the three again‿and report the results. |
|:---|:---|
| 読み | アフター フィクスィン、ラン ザ スリー アゲイ‿ナン(ド) リポー(ト) ザ リザルツ |
| つながり | again‿and（子音＋母音） |
| JP | 直したあと、3 つをもう一度実行して、結果を報告してください。 |

## [Do not]（やってはいけないこと）

読み: ドゥー ノッ(ト) ／ つながり: なし（単語ごとに区切って読む）

| EN | Silence lint warnings by disabling them |
|:---|:---|
| 読み | サイレンス リン(ト) ウォーニングズ バイ ディセイブリン ゼム |
| つながり | なし（単語ごとに区切って読む） |
| JP | 無効化して、lint の警告を黙らせること |

| EN | Delete‿tests, skip tests, or‿rewrite‿expected values |
|:---|:---|
| 読み | ディリー‿テスツ、スキップ テスツ、オ‿リライ‿ティクスペクティッ(ド) ヴァリューズ |
| つながり | Delete‿tests（同じ・似た子音が続く（前の音は言わない）） ／ or‿rewrite（同じ・似た子音が続く（前の音は言わない）） ／ rewrite‿expected（t＋母音（t がラ行に近い音になる）） |
| JP | テストを削除する、スキップする、期待値を書き換えること |

| EN | Lower the strictness‿of‿a command‿to make‿it pass (for‿example, removing the option that‿turns warnings‿into errors) |
|:---|:---|
| 読み | ロウワー ザ ストリクトネ‿ソ‿ヴァ コマン‿トゥ メイ‿キッ(ト) パス（フォ‿リグザンプル、リムーヴィン ジ オプション ザッ‿ターンズ ウォーニング‿ズィントゥ エラーズ） |
| つながり | strictness‿of（子音＋母音） ／ of‿a（子音＋母音） ／ command‿to（同じ・似た子音が続く（前の音は言わない）） ／ make‿it（子音＋母音） ／ for‿example（r＋母音） ／ that‿turns（同じ・似た子音が続く（前の音は言わない）） ／ warnings‿into（子音＋母音） |
| JP | 通すために、コマンドの厳しさを下げること（例: 警告をエラーにするオプションを外す） |

| EN | If you think one‿of these‿is necessary, do not‿do it. Explain why and‿ask me. |
|:---|:---|
| 読み | イフ ユー スィンク ワ‿ノヴ ズィー‿ズィズ ネセサリー、ドゥー ナッ‿ドゥー イッ(ト)。イクスプレイン ワイ アン‿ダスク ミー |
| つながり | one‿of（子音＋母音） ／ these‿is（子音＋母音） ／ not‿do（同じ・似た子音が続く（前の音は言わない）） ／ and‿ask（子音＋母音） |
| JP | これらのどれかが必要だと思ったときは、実行せず、理由を説明して私に聞いてください。 |

---

## この指示文の難しい単語（12 語）

[baseline](words.md#baseline) ／ [disable](words.md#disable) ／ [expected value](words.md#expected-value) ／ [record](words.md#record) ／ [reformat](words.md#reformat) ／ [revert](words.md#revert) ／ [silence](words.md#silence) ／ [skip](words.md#skip) ／ [source of truth](words.md#source-of-truth) ／ [strictness](words.md#strictness) ／ [task runner](words.md#task-runner) ／ [unrelated](words.md#unrelated)
