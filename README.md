#### README

## アプリ名
みんなのおすすめPS4ソフト

### 概要
自身がプレイしたPS4のゲームソフトの評価を共有できるサービス。  
また、レビューの点数順に並べたり、気になるソフトの検索ができる。

### コンセプト
PS4ソフトの評価を共有し、購入に役立てるサービス。

### 機能一覧
  - [x] ゲームソフトの一覧表示（タイトル名、評価数、評価点数を表示）
  - [x] 条件に合うソフトの検索＆ソート機能
  - [x] レビュー機能（レビュー投稿・編集・削除ができる、レビュー編集・削除は投稿者と管理者のみ可能）
  - [x] ゲームソフト気になる機能（登録、解除、ユーザーごとの一覧表示）
  - [x] ゲームソフト持ってる機能（登録、解除、ユーザーごと一覧表示）
  - [x] コメント機能（コメント投稿はページ遷移なしで実行できる、コメント編集・削除は投稿者と管理者のみ可能）
  - [x] ユーザーのフォロー機能（フォロー、解除、ユーザーごと一覧表示）
  - [x] ログイン機能（チェック用のゲストユーザーを含む）
  - [x] ユーザー登録機能（名前、メールアドレス、パスワードは必須。プロフィール文章、アイコンは任意。）
  - [x] ゲームタイトル情報は管理者のみ編集＆削除が可能（作成は一般ユーザーでも可）
  - [x] 管理者機能（管理者は一覧表示、編集、削除が行える）

### ブラッシュアップ課題（追加機能）
  - [x] ダイレクトメッセージ機能の実装
  - [ ] 点数表示のグラフ化
  - [ ] 横並び表示デザインの実装
  - [ ] レスポンシブデザインの実装
  - [ ] 余白等、細かいデザインの修正
  - [ ] herokuデプロイ時、seedデータの画像パスが通らないエラーの修正
  - [ ] AWSへのデプロイ
  - [ ] Amazonサイトから、seedデータをスクレイピングで用意する機能
  - [ ] 気になる登録をしたソフトの新規レビューお知らせ機能（ローカルは実装済み、デプロイ時のエラー解消）
  - [ ] フォローしたユーザーの新規レビューお知らせ機能（ローカルは実装済み、デプロイ時のエラー解消）
  - [x] Ajax関連（コメント編集・削除の非同期通信）
  - [x] Ajax関連（コメント・フォロー機能のfeatureテスト）
  - [x] Ajax関連（コメント投稿時エラー文の表示位置）

### バージョン
* Ruby 2.6.5
* Rails 5.2.4

### 追加使用Gem
  * carrierwave
  * mini_magick
  * devise
  * devise-i18n
  * devise-i18n-views
  * ransack
  * kaminari
  * bootstrap-sass
  * letter_opener_web
  * rails-i18n
  * enum_help
  * rspec-rails
  * launchy
  * webdrivers
  * factory_bot_rails
  * faker
  * spring-commands-rspec
  * database_cleaner  
  * bootstrap
  * jquery-rails

### カタログ設計
https://docs.google.com/spreadsheets/d/1nw_STLqtFgPfUg-YeH2_9M1k0W_GEIFVPajtXokiJPA/edit?usp=sharing

### ER図・テーブル定義
https://docs.google.com/spreadsheets/d/1DXMmMMzCVhBJzmVXw_SjGSYcPuXeD4j6g5MPgje7QqM/edit?usp=sharing

### 画面遷移図
https://docs.google.com/presentation/d/1vAB0EuJuOOhw71vmgpAJ8TCp-g-9w1eJrdSchDRhWdQ/edit?usp=sharing

### 画面ワイヤーフレーム
https://docs.google.com/presentation/d/1VyeEXDSZvNxQF6HzhPR4ytd48e-dX0hfbp_CR2u0vQE/edit?usp=sharing