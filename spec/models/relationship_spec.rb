require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user1 = User.new(name: "name1", introduce: "introduce1", icon: "icon_URL1", admin: false, email: "test1@e.mail", password: "password1")
    # @user1.skip_confirmation!
    @user1.save

    @user2 = User.new(name: "name2", introduce: "introduce2", icon: "icon_URL2", admin: false, email: "test2@e.mail", password: "password2")
    # @user2.skip_confirmation!
    @user2.save
  end

  it "is valid with differnt follower_id and followd_id" do
    relationship = Relationship.create(follower_id: @user1.id, followed_id: @user2.id)
    expect(relationship).to be_valid
  end

  it "is invalid without a follower_id" do
    relationship = Relationship.create(followed_id: @user1.id)
    expect(relationship).not_to be_valid
  end

  it "is invalid without a folowed_id" do
    relationship = Relationship.create(follower_id: @user1.id)
    expect(relationship).not_to be_valid
  end

  it "is invalid if follow user doesn't exist" do
    relationship = Relationship.create(follower_id: @user2.id + 1, followed_id: @user1.id)
    expect(relationship).not_to be_valid
  end

  it "is invalid if followed user doesn't exist" do
    relationship = Relationship.create(follower_id: @user1.id, followed_id: @user2.id + 1)
    expect(relationship).not_to be_valid
  end

  it "is invalid if follower user is same followed user" do
    relationship = Relationship.create(follower_id: @user1.id, followed_id: @user1.id)
    expect(relationship).not_to be_valid
  end
end