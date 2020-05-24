require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = Game.create(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")

    @user= User.new(name: "name", introduce: "introduce", icon: "icon_URL", admin: false, email: "test@e.mail", password: "password")
    @user.skip_confirmation!
    @user.save
  end
  
  context 'When a user is deleted' do
    it "deletes reviews associated with that user" do
      Review.create(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
      expect{ @user.destroy }.to change{ Review.count }.by(-1)
    end

    it "deletes comments associated with that user" do
      comment = Comment.create(body: "body", game_id: @game.id, user_id: @user.id)
      expect{ @user.destroy }.to change{ Comment.count }.by(-1)
    end
    
    it "deletes favorites associated with that user" do
      favorite = Favorite.create(game_id: @game.id, user_id: @user.id)
      expect{ @user.destroy }.to change{ Favorite.count }.by(-1)
    end

    it "deletes owns associated with that user" do
      own = Own.create(game_id: @game.id, user_id: @user.id)
      expect{ @user.destroy }.to change{ Own.count }.by(-1)
    end
  end
end