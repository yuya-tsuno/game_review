require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @game = Game.create(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    @user= User.new(name: "name", introduce: "introduce", icon: "icon_URL", admin: false, email: "test@e.mail", password: "password")
    @user.skip_confirmation!
    @user.save  
  end

  it "is valid with a body, game_id and user_id" do
    comment = Comment.create(body: "body", game_id: @game.id, user_id: @user.id)
    expect(comment).to be_valid
  end

  it "is invalid without a body" do
    comment = Comment.create(game_id: @game.id, user_id: @user.id)
    expect(comment).not_to be_valid
  end

  it "is invalid without a game_id" do
    comment = Comment.create(body: "body", user_id: @user.id)
    expect(comment).not_to be_valid
  end

  it "is invalid without an user_id" do
    comment = Comment.create(body: "body", game_id: @game.id)
    expect(comment).not_to be_valid
  end

  it "is invalid if game doesn't exist" do
    comment = Comment.create(body: "body", game_id: @game.id + 1, user_id: @user.id)
    expect(comment).not_to be_valid
  end

  it "is invalid if user doesn't exist" do
    comment = Comment.create(body: "body", game_id: @game.id, user_id: @user.id + 1)
    expect(comment).not_to be_valid
  end
end