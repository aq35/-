# 英語の学習 0. 共通ルール（毎回最初に貼る）

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 0 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [リンキングの解説](linking.md) ／ [単語表](words.md)

> `‿` は、前の単語の終わりの音と、次の単語の始めの音が**つながる場所**です。英文と読みの同じ位置に入れています。

## [Common rules]（共通ルール）

読み: コモン ルールズ

| EN | Answer‿in Japanese. |
|:---|:---|
| 読み | アンサ‿リン ジャパニーズ |
| つながり | Answer‿in（r＋母音） |
| JP | 日本語で回答してください。 |

| EN | Separate facts (things you confirmed‿in the code‿or documents) from guesses. |
|:---|:---|
| 読み | セパレイ(ト) ファクツ（スィングズ ユー コンファーム‿ディン ザ コウ‿ドア ドキュメンツ）フロム ゲッセズ |
| つながり | confirmed‿in（子音＋母音） ／ code‿or（子音＋母音） |
| JP | 事実（コードや文書で確認できたこと）と、推測を分けてください。 |

| EN | Write "unknown" for‿anything you could not confirm. |
|:---|:---|
| 読み | ライ(ト) アンノウン フォ‿レニスィング ユー クッ(ド) ナッ(ト) コンファーム |
| つながり | for‿anything（r＋母音） |
| JP | 確認できなかったことは「不明」と書いてください。 |

| EN | Give‿evidence‿as file paths‿and line‿numbers. |
|:---|:---|
| 読み | ギ‿ヴェヴィデン‿サズ ファイル パス‿サン(ド) ライ‿ナンバーズ |
| つながり | Give‿evidence（子音＋母音） ／ evidence‿as（子音＋母音） ／ paths‿and（子音＋母音） ／ line‿numbers（同じ・似た子音が続く（前の音は言わない）） |
| JP | 根拠として、ファイルのパスと行番号を示してください。 |

| EN | Do not make‿any change that‿I did not‿ask for. |
|:---|:---|
| 読み | ドゥー ナッ(ト) メイ‿ケニィ チェインジ ザ‿ライ ディッ(ド) ナ‿ラスク フォー |
| つながり | make‿any（子音＋母音） ／ that‿I（t＋母音（t がラ行に近い音になる）） ／ not‿ask（t＋母音（t がラ行に近い音になる）） |
| JP | 私が頼んでいない変更はしないでください。 |

| EN | Do not‿do any of the following‿until‿I tell you to: |
|:---|:---|
| 読み | ドゥー ナッ‿ドゥー エニィ オヴ ザ フォロウイン‿ガンティ‿ライ テル ユー トゥ |
| つながり | not‿do（同じ・似た子音が続く（前の音は言わない）） ／ following‿until（子音＋母音） ／ until‿I（子音＋母音） |
| JP | 次のことは、私が指示するまでしないでください: |

| EN | commit, push, delete branches‿or tags, force-push, rewrite history, operate‿on the production‿environment, read secrets. |
|:---|:---|
| 読み | カミッ(ト)、プッシュ、ディリー(ト) ブランチ‿ゾア タグズ、フォース プッシュ、リライ(ト) ヒストリー、アパレイ‿ロン ザ プロダクショ‿ネンヴァイロンメン(ト)、リー(ド) スィークレッツ |
| つながり | branches‿or（子音＋母音） ／ operate‿on（t＋母音（t がラ行に近い音になる）） ／ production‿environment（子音＋母音） |
| JP | コミット、push、ブランチやタグの削除、force push、履歴の書き換え、本番環境への操作、秘密情報の読み出し。 |

| EN | Keep going‿on the parts you can. |
|:---|:---|
| 読み | キー(プ) ゴウイン‿ゴン ザ パーツ ユー キャン |
| つながり | going‿on（子音＋母音） |
| JP | できる部分は進めてください。 |

| EN | Do not guess when something‿is‿unclear; collect‿your questions‿and‿ask them‿at the end. |
|:---|:---|
| 読み | ドゥー ナッ(ト) ゲス ウェン サムスィン‿ギ‿ザンクリア；コレク‿チョア クエスチョン‿ザン‿ダスク ゼ‿マッ(ト) ジ エンド |
| つながり | something‿is（子音＋母音） ／ is‿unclear（子音＋母音） ／ collect‿your（t＋you（チュ）） ／ questions‿and（子音＋母音） ／ and‿ask（子音＋母音） ／ them‿at（子音＋母音） |
| JP | 不明なことは推測せず、質問を集めて最後にまとめて聞いてください。 |

## [Project assumptions]（プロジェクトの前提）

読み: プロジェクト アサンプションズ

| EN | The GraphQL schema is‿in schema/ (a git submodule). |
|:---|:---|
| 読み | ザ グラフキューエル スキーマ イ‿ズィン スキーマ（ア ギッ(ト) サブモジュール） |
| つながり | is‿in（子音＋母音） |
| JP | GraphQL のスキーマは schema/（git サブモジュール）にあります。 |

| EN | Do not change‿any file‿inside schema/. |
|:---|:---|
| 読み | ドゥー ナッ(ト) チェイン‿ジェニィ ファイ‿リンサイ(ド) スキーマ |
| つながり | change‿any（子音＋母音） ／ file‿inside（子音＋母音） |
| JP | schema/ の中のファイルは変更しないでください。 |

| EN | A formatter, a linter, and‿test commands‿always‿exist. |
|:---|:---|
| 読み | ア フォーマッター、ア リンター、アン‿テス(ト) コマン‿ゾールウェイ‿ズィグズィスト |
| つながり | and‿test（同じ・似た子音が続く（前の音は言わない）） ／ commands‿always（子音＋母音） ／ always‿exist（子音＋母音） |
| JP | フォーマッター、lint、テストのコマンドは必ずあります。 |

| EN | If you do not know them, find them |
|:---|:---|
| 読み | イフ ユー ドゥー ナッ(ト) ノウ ゼム、ファイン(ド) ゼム |
| つながり | なし（単語ごとに区切って読む） |
| JP | 分からなければ、探してください。 |

---

## この指示文の難しい単語（10 語）

[assumption](words.md#assumption) ／ [collect](words.md#collect) ／ [confirm](words.md#confirm) ／ [environment](words.md#environment) ／ [evidence](words.md#evidence) ／ [fact](words.md#fact) ／ [guess](words.md#guess) ／ [production](words.md#production) ／ [secret](words.md#secret) ／ [unclear](words.md#unclear)
