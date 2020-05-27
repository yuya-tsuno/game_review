require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @game = Game.create(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    @user= User.new(name: "name", introduce: "introduce", icon: "icon_URL", admin: false, email: "test@e.mail", password: "password")
    # @user.skip_confirmation!
    @user.save  
  end

  it "is valid with a direction, operability, story, volume, like, summary, body, game_id and user_id" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
    expect(review).to be_valid
  end

  it "is valid without setting direction, operability, story, volume or like because of default value" do
    review = Review.new(summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id)
    expect(review).to be_valid
  end

  it "is invalid without a summary" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, body: "review_body", game_id: @game.id, user_id: @user.id)
    expect(review).not_to be_valid
  end

  it "is invalid without a body" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", game_id: @game.id, user_id: @user.id)
    expect(review).not_to be_valid
  end

  it "is invalid without a game_id" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", user_id: @user.id)
    expect(review).not_to be_valid
  end

  it "is invalid without a user_id" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id)
    expect(review).not_to be_valid
  end

  it "is invalid if game doesn't exist" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id + 1, user_id: @user.id)
    expect(review).not_to be_valid
  end

  it "is invalid if user doesn't exist" do
    review = Review.new(direction: 1, operability: 1, story: 1, volume: 1, like: 1, summary: "summary", body: "review_body", game_id: @game.id, user_id: @user.id + 1)
    expect(review).not_to be_valid
  end

end