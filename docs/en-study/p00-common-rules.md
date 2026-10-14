# 英語の学習 0. 共通ルール（毎回最初に貼る）

英語版の指示文（[09-my-ai-prompts.en.md](../09-my-ai-prompts.en.md)）の 0 番を、1 文ずつ「英語・読み方・日本語訳」で学びます。日本語の指示文は [09-my-ai-prompts.md](../09-my-ai-prompts.md) にあります。

[← 学習ページの一覧](index.md) ／ [単語表](words.md)

## [Common rules]（共通ルール）

読み: コモン ルールズ

| EN | Answer in Japanese. |
|:---|:---|
| 読み | アンサーリン ジャパニーズ |
| JP | 日本語で回答してください。 |

| EN | Separate facts (things you confirmed in the code or documents) from guesses. |
|:---|:---|
| 読み | セパレイ(ト) ファクツ（スィングズ ユー コンファームディン ザ コウド オア ドキュメンツ）フロム ゲッセズ |
| JP | 事実（コードや文書で確認できたこと）と、推測を分けてください。 |

| EN | Write "unknown" for anything you could not confirm. |
|:---|:---|
| 読み | ライ(ト) アンノウン フォー エニスィング ユー クドゥン(ト) コンファーム |
| JP | 確認できなかったことは「不明」と書いてください。 |

| EN | Give evidence as file paths and line numbers. |
|:---|:---|
| 読み | ギヴ エヴィデンス アズ ファイル パスィズ アン(ド) ライン ナンバーズ |
| JP | 根拠として、ファイルのパスと行番号を示してください。 |

| EN | Do not make any change that I did not ask for. |
|:---|:---|
| 読み | ドゥー ノッ(ト) メイク エニィ チェインジ ザッ(ト) アイ ディドゥン(ト) アスク フォー |
| JP | 私が頼んでいない変更はしないでください。 |

| EN | Do not do any of the following until I tell you to: |
|:---|:---|
| 読み | ドゥー ノッ(ト) ドゥー エニィ オヴ ザ フォロウイン アンティル アイ テル ユー トゥ |
| JP | 次のことは、私が指示するまでしないでください: |

| EN | commit, push, delete branches or tags, force-push, rewrite history, operate on the production environment, read secrets. |
|:---|:---|
| 読み | カミッ(ト)、プッシュ、ディリー(ト) ブランチズ オア タグズ、フォース プッシュ、リライ(ト) ヒストリー、アパレイ(ト) オン ザ プロダクション エンヴァイロンメン(ト)、リード スィークレッツ |
| JP | コミット、push、ブランチやタグの削除、force push、履歴の書き換え、本番環境への操作、秘密情報の読み出し。 |

| EN | Keep going on the parts you can. |
|:---|:---|
| 読み | キープ ゴウイン オン ザ パーツ ユー キャン |
| JP | できる部分は進めてください。 |

| EN | Do not guess when something is unclear; collect your questions and ask them at the end. |
|:---|:---|
| 読み | ドゥー ノッ(ト) ゲス ウェン サムスィン イズ アンクリア；コレクト ヨア クエスチョンズ アンダスク ゼム アッ(ト) ジ エンド |
| JP | 不明なことは推測せず、質問を集めて最後にまとめて聞いてください。 |

## [Project assumptions]（プロジェクトの前提）

読み: プロジェクト アサンプションズ

| EN | The GraphQL schema is in schema/ (a git submodule). |
|:---|:---|
| 読み | ザ グラフキューエル スキーマ イズ イン スキーマ（ア ギッ(ト) サブモジュール） |
| JP | GraphQL のスキーマは schema/（git サブモジュール）にあります。 |

| EN | Do not change any file inside schema/. |
|:---|:---|
| 読み | ドゥー ノッ(ト) チェインジ エニィ ファイル インサイド スキーマ |
| JP | schema/ の中のファイルは変更しないでください。 |

| EN | A formatter, a linter, and test commands always exist. |
|:---|:---|
| 読み | ア フォーマッター、ア リンター、アン(ド) テス(ト) コマンズ オールウェイズ イグズィスト |
| JP | フォーマッター、lint、テストのコマンドは必ずあります。 |

| EN | If you do not know them, find them |
|:---|:---|
| 読み | イフ ユー ドゥー ノッ(ト) ノウ ゼム、ファインド ゼム |
| JP | 分からなければ、探してください。 |

---

## この指示文の難しい単語（10 語）

[assumption](words.md#assumption) ／ [collect](words.md#collect) ／ [confirm](words.md#confirm) ／ [environment](words.md#environment) ／ [evidence](words.md#evidence) ／ [fact](words.md#fact) ／ [guess](words.md#guess) ／ [production](words.md#production) ／ [secret](words.md#secret) ／ [unclear](words.md#unclear)
