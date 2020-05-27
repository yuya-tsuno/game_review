require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :feature do
  before do
    @game = Game.create(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    @user= User.new(name: "name", introduce: "introduce", icon: "icon_URL", admin: false, email: "test@e.mail", password: "password")
    # @user.skip_confirmation!
    @user.save  
  end
  
  def log_in # ログインします。
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    find(".login_button").click
  end

  feature 'サインイン（ユーザー登録）画面' do
    context 'ユーザー登録された場合' do
      it 'ログインも同時に行われる' do
        log_in
        expect(page).to have_content "ログインしました"
        expect(page).to have_content "#{@user.name}さんのプロフィール"
      end
    end

    context 'ログイン時に新規ユーザー登録画面にアクセスした場合' do
      it 'トップページに移動' do
        log_in
        visit new_user_session_path
        expect(page).to have_content "すでにログインしています"
      end
    end
  end
  
  feature 'プロフィール（ユーザー詳細）画面' do
    context '自分（current_user）以外のユーザの編集ページ（user#edit）にアクセスした場合' do
      it 'トップページに移動' do
        @user2= User.new(name: "name2", introduce: "introduce2", icon: "icon_URL2", admin: false, email: "test2@e.mail", password: "password2")
        # @user2.skip_confirmation!
        @user2.save
        log_in #@user2としてだはなく、@userとしてログインします
        visit edit_user_path(@user2.id)
        expect(page).to have_content 'あなたのアカウントではアクセス権限がありません'
        expect(page).to have_content 'ゲームタイトル一覧'
        # save_and_open_page
      end
    end
  end

  feature 'ユーザー詳細画面' do
    context '任意のユーザー詳細画面に遷移した場合' do
      it '該当ユーザーのプロフィール情報・投稿したレビュー・気になるゲーム・持ってるゲームが表示されたページに遷移すること' do
        Review.create(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
        Favorite.create(game_id: @game.id, user_id: @user.id)
        Own.create(game_id: @game.id, user_id: @user.id)
        
        log_in
        users = User.all
        users.each do |user|
          visit user_path(user.id)
          expect(page).to have_content user.id
          expect(page).to have_content user.name

          user.reviews.each do |review|
            expect(page).to have_content review.summary
            expect(page).to have_content review.game.title
            expect(page).to have_content review.direction + review.operability + review.story + review.volume + review.like
          end
          
          user.favorites.each do |favorite|
            expect(page).to have_content favorite.game.title
            expect(page).to have_content favorite.game.company
          end

          user.owns.each do |own|
            expect(page).to have_content own.game.title
            expect(page).to have_content own.game.company
          end
        end
      end
    end
  end
end