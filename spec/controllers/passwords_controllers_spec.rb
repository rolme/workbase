require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do


  describe "POST #create" do
    it "Should not send reset password email" do
      post :create, params: {user:{email: 'test@test.com'}}
      expect(flash[:danger]).to eql('User not found for given email')
    end

    it "Should send reset password email" do
      user = FactoryGirl.create(:user1)
      post :create, params: {user:{email: 'test-user@testemail.com'}}
      user = User.find_by(email: 'test-user@testemail.com')
      expect(user.reset_password_token.blank?).to eql(false)
    end
  end

  describe "PUT #update" do
    it "Should not reset password " do
      user = FactoryGirl.create(:user1)
      put :update, params: {user: {new_password: 'demo', password_confirmation: 'demo', reset_password_token: '234523452345'}}
      user = User.find_by(email: 'test-user@testemail.com')
      expect(user.password_digest_changed?).to eql(false)
    end

    it "Should reset password " do
      user = FactoryGirl.create(:user1)
      token = Digest::MD5.hexdigest(user.email)
      post :create, params: {user:{email: 'test-user@testemail.com'}}
      put :update, params: {user: {new_password: 'demo', password_confirmation: 'demo', reset_password_token: token}}
      user = User.find_by(email: 'test-user@testemail.com')
      expect(user.authenticate('demo').blank?).to eql(false)
    end
  end
end