require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with a title, company, genre, price" do
    game = Game.new(title: "title", company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    expect(game).to be_valid
  end
  
  it "is invalid without a title" do
    game = Game.new(company: "company", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    expect(game).not_to be_valid
  end

  it "is invalid without a company" do
    game = Game.new(title: "title", price: 5000, genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    expect(game).not_to be_valid
  end
  
  it "is invalid without a genre" do
    game = Game.new(title: "title", company: "company", price: 5000, released_at: "2020-05-05", story: "story", icon: "icon_URL")
    expect(game).not_to be_valid
  end
  
    it "is valid without a price because of default value" do
      game = Game.new(title: "title", company: "company", genre: 5, released_at: "2020-05-05", story: "story", icon: "icon_URL")
      expect(game).to be_valid
    end
  
  it "is valid without a released_at, story or icon" do
    game = Game.new(title: "title", company: "company", price: 5000, genre: 5)
    expect(game).to be_valid
  end

  it "is invalid with a duplicate title" do
    Game.create(title: "title", company: "company5", price: 5000, genre: 5, released_at: "2020-05-05")
    game = Game.new(title: "title", company: "company", price: 5000, genre: 5,released_at: "2020-05-05")
    expect(game).not_to be_valid
  end

  it "is invalid with Sting in price" do
    game = Game.new(title: "title", company: "company", price: "String", genre: 6, released_at: "2020-05-05")
    expect(game).not_to be_valid
  end
end