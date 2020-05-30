require 'rails_helper'

RSpec.describe 'ゲーム管理機能', type: :feature do
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
  
  feature 'ゲーム一覧画面' do
    context 'ゲームを登録済の場合' do
      scenario '登録済みのタスク表示されること' do
        visit games_path
        expect(page).to have_content 'title'
      end
    end

    context '複数のゲームを作成した場合' do
      it 'ゲームが作成日時の降順に並んでいること' do
        @game2 = Game.create(title: "title2", company: "company2", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
        visit games_path
        game_list = all('.game_row') #タスク一覧を配列として取得するため、View側でidを振っておく
        expect(game_list[0]).to have_content 'title2'
        expect(game_list[1]).to have_content 'title'
      end

      it 'タイトル・会社名による検索機能' do
        @search_game = Game.create(title: "search_title", company: "search_company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
        @miss_game = Game.create(title: "miss_title", company: "miss_company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
        visit games_path
        # save_and_open_page
        # fill_in "title_or_company", with: "search"
        find(".search_title_or_company_form").set("search")
        click_on '検索'
        expect(page).to have_content 'search'
        expect(page).not_to have_content 'miss'
      end
    end
  end

  feature '新規ゲーム登録画面' do
    context '必要項目を入力して、登録ボタンを押した場合' do
      it '新規ゲームが保存されること' do
        visit new_game_path
        fill_in "タイトル", with: "新タイトル"
        fill_in "販売会社", with: "新会社"
        click_on '登録する'
        expect(page).to have_content "新タイトル"
        expect(page).to have_content "新会社"
      end
    end
  end

  feature 'ゲーム詳細画面' do
    context '任意のゲーム詳細画面に遷移した場合' do
      it '該当ゲームの内容・レビュー・コメントが表示されたページに遷移すること' do
        Review.create(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
        Comment.create(body: "body", game_id: @game.id, user_id: @user.id)

        games = Game.all
        games.each do |game|
          visit game_path(game.id)
          # save_and_open_page

          expect(page).to have_content game.title
          expect(page).to have_content game.company
          expect(page).to have_content game.genre_i18n
          expect(page).to have_content game.price

          game.reviews.each do |review|
            expect(page).to have_content review.user.name
            expect(page).to have_content review.summary
            expect(page).to have_content review.direction + review.operability + review.story + review.volume + review.like
          end
          
          game.comments.each do |comment|
            expect(page).to have_content comment.body
            expect(page).to have_content comment.user.name
          end
        end
      end
    end
  end
end