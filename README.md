# README

## アプリ名
みんなのおすすめPS4ソフト

### 概要
自身がプレイしたPS4のゲームソフトの評価を共有できるサービス。  
また、評価順に並べたり、気になるソフトやプレーヤーの口コミも検索できる。

### コンセプト
PS4ソフトの評価を共有し、購入に役立てるサービス。

### バージョン
* Ruby 2.6.5
* Rails 5.2.4

### 機能一覧
  - [ ] ログイン機能
  - [ ] ユーザー登録機能（名前、メールアドレス、パスワードは必須。プロフィール文章、アイコンは任意。）
  - [ ] 管理者機能（管理者はゲームの投稿・編集・削除が行える）
  - [ ] ゲームソフト一覧表示機能（タイトル名、評価数、評価点数を表示）
  - [ ] 評価投稿機能
  - [ ] 評価編集機能
  - [ ] 評価削除機能
  - [ ] ゲームタイトル情報は管理者のみ編集＆削除が可能（作成は一般ユーザーでも可）
  - [ ] 条件に合うソフトの検索＆ソート機能
  - [ ] ゲームソフト気になる登録機能
  - [ ] ゲームソフト持ってる登録機能
  - [ ] 気になる登録をしたソフトの新規レビューお知らせ機能
  - [ ] コメント投稿機能
  - [ ] コメント削除機能(コメント削除はコメントした本人と管理者のみ可能)
  - [ ] コメント機能はページ遷移なしで実行できる

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