require 'rails_helper'

RSpec.describe 'レビュー管理機能', type: :feature do
  before do
    @game = Game.create(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    @user= User.new(name: "name", introduce: "introduce", icon: "icon_URL", admin: false, email: "test@e.mail", password: "password")
    # @user.skip_confirmation!
    @user.save  

    # ログインします。
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    find(".login_button").click
  end
  
  feature '新規レビュー登録画面' do
    context '必要項目を入力して、登録ボタンを押した場合' do
      it '新規レビューが保存されること' do
        visit new_review_path
        select @game.title, from: 'review[game_id]'
        fill_in "見出し", with: "見出し"
        fill_in "レビュー本文", with: "レビュー本文！"
        click_on '登録する'
        expect(page).to have_content "レビュー本文！"
        expect(page).to have_content "#{@user.name}さんによる#{@game.title}へのレビュー"
      end
    end
  end

  feature 'レビュー詳細画面' do
    context '任意のゲーム詳細画面に遷移した場合' do
      it '該当ゲームの内容・レビュー・コメントが表示されたページに遷移すること' do
        @review = Review.create(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
        visit review_path(@review.id)

        expect(page).to have_content @review.summary
        expect(page).to have_content "#{@review.user.name}さんによる#{@review.game.title}へのレビュー"
        expect(page).to have_content @review.direction
        expect(page).to have_content @review.operability
        expect(page).to have_content @review.story
        expect(page).to have_content @review.volume
        expect(page).to have_content @review.like
        expect(page).to have_content @review.direction + @review.operability + @review.story + @review.volume + @review.like
        expect(page).to have_content @review.body
      end
    end
  end
end