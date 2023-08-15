# 概要
- グランドセフトオートオンライン（ローカルサーバ）

- 拡張機能を開発した。

<details>

<summary>開発環境</summary>

|エディター|言語|バージョン管理|データベース|
|:---|:---|:---|:---|
|vscode|Lua|gitbash|mysql|

</details>

<details>

<summary>ドキュメント必読</summary>

||Lua-document-version5.3|
|:---:|:---:|
|英語|http://www.lua.org/manual/5.3/|
|日本語|http://milkpot.sakura.ne.jp/lua/lua53_manual_ja.html#contents|

||mysql-document-version8.0|
|:---:|:---:|
|日本語|https://dev.mysql.com/doc/refman/8.0/ja/|

||fiveM-document|
|:---:|:---:|
|英語|https://docs.fivem.net/docs/|

</details>

# 本題
|簡単|難しい|
|:---:|:---:|
|https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/|https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/|

<details>
<summary>ディレクトリ構造説明(簡単)</summary>

||artifacts(サーバ本体)||||
|---:|---:|---:|---:|---:|
|\|__|txData|
||\|__|CFXDefault_D5D44F.base|
||start_5848_default.bat(起動用)|\|__|cache(サーバ起動時に自動生成)|
|||default|resources(mod)|
|||admins.json(管理者権限設定)|\|__|MOD...etc
||||server.cfg(設定ファイル)|
||||server.cfg.bkp(設定ファイルバックアップ)|
</details>

- [設定ファイル](https://github.com/kakusan0/server-data-key/blob/main/server.cfg) ←./server-data　に格納

# README.mdの書き方
- [基本的な書き方とフォーマットの構文](https://docs.github.com/ja/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
- [高度なフォーマットを使用して作業する](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting)
