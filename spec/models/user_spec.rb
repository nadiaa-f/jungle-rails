require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "it shouldn't create a user if password and password_confirmations don't match" do
      @user = User.create(name: "Bob The Builder", email: "bobthebuilder@buildthings.com", password: "ilikebubbaaa", password_confirmation: "ilikebubba")
      expect(@user.password).to_not eql (@user.password_confirmation)
    end

    it "it should create a matching password and password_confirmations " do
      @user = User.create(name: "Amanda", email: "a123@a.com", password: "smallsnail", password_confirmation: "smallsnail")
      expect(@user.password).to eql (@user.password_confirmation)
    end

    it "shouldn't create an account if the password is too short" do
      @user = User.create(name: "Amanda", email: "a123@a.com", password: "bbw", password_confirmation: "bbw")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it "it shouldn't allow the user to login if the e-mail isn't found" do
      expect(User.authenticate_with_credentials('jam@hotmail.com', 'chicken123')).to be_falsey 
    end
  end
end