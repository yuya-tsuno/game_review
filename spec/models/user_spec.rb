require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password and admin" do
    user= User.new(name: "name", email: "test@e.mail", password: "password", admin: false)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user= User.new(email: "test@e.mail", password: "password", admin: false)
    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user= User.new(name: "name", password: "password", admin: false)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user= User.new(name: "name", email: "test@e.mail", admin: false)
    expect(user).not_to be_valid
  end

  it "is valid without setting admin because of default value" do
    user= User.new(name: "name", email: "test@e.mail", password: "password")
    expect(user).to be_valid
  end
end