#### README

## アプリ名
みんなのおすすめPS4ソフト

### 概要
自身がプレイしたPS4のゲームソフトの評価を共有できるサービス。  
また、レビューの点数順に並べたり、気になるソフトの検索ができる。

### コンセプト
PS4ソフトの評価を共有し、購入に役立てるサービス。

### バージョン
* Ruby 2.6.5
* Rails 5.2.4

### 機能一覧
  - [ ] ゲームソフト一覧表示機能（タイトル名、評価数、評価点数を表示）
  - [ ] 条件に合うソフトの検索＆ソート機能
  - [ ] レビュー機能（レビュー投稿・編集・削除ができる、レビュー編集・削除はコメントした本人と管理者のみ可能）
  - [ ] ゲームソフト気になる機能（登録、解除、ユーザーごとの一覧表示）
  - [ ] ゲームソフト持ってる機能（登録、解除、ユーザーごと一覧表示）
  - [ ] コメント機能（コメント投稿はページ遷移なしで実行できる、コメント編集・削除はコメントした本人と管理者のみ可能）
  - [ ] ユーザーのフォロー機能（フォロー、解除、ユーザーごと一覧表示）
  - [ ] ログイン機能（チェック用のゲストユーザーを含む）
  - [ ] ユーザー登録機能（名前、メールアドレス、パスワードは必須。プロフィール文章、アイコンは任意。）
  - [ ] ゲームタイトル情報は管理者のみ編集＆削除が可能（作成は一般ユーザーでも可）
  - [ ] 管理者機能（管理者は一覧表示、編集、削除が行える）

### カタログ設計
https://docs.google.com/spreadsheets/d/1nw_STLqtFgPfUg-YeH2_9M1k0W_GEIFVPajtXokiJPA/edit?usp=sharing

### ER図・テーブル定義
https://docs.google.com/spreadsheets/d/1DXMmMMzCVhBJzmVXw_SjGSYcPuXeD4j6g5MPgje7QqM/edit?usp=sharing

### 画面遷移図
https://docs.google.com/presentation/d/1vAB0EuJuOOhw71vmgpAJ8TCp-g-9w1eJrdSchDRhWdQ/edit?usp=sharing

### 画面ワイヤーフレーム
https://docs.google.com/presentation/d/1VyeEXDSZvNxQF6HzhPR4ytd48e-dX0hfbp_CR2u0vQE/edit?usp=sharing

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

### ブラッシュアップ課題
  - [ ] ダイレクトメッセージ機能の実装
  - [ ] 点数表示のグラフ化
  - [ ] 横並び表示デザインの実装
  - [ ] レスポンシブデザインの実装
  - [ ] AWSへのデプロイ
  - [ ] herokuデプロイ時、seedデータの画像パスが通らないエラーの修正
  - [ ] Amazonサイトから、seedデータをスクレイピングで用意する機能
  - [ ] 気になる登録をしたソフトの新規レビューお知らせ機能（ローカルは実装済み、デプロイ時のエラー解消）
  - [ ] フォローしたユーザーの新規レビューお知らせ機能（ローカルは実装済み、デプロイ時のエラー解消）
  - [ ] Ajax関連（コメント編集・削除の非同期通信）
  - [ ] Ajax関連（コメント・フォロー機能のfeatureテスト）
  - [ ] Ajax関連（コメント投稿時エラー文の表示位置）