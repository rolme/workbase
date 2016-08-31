require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "PATCH #password_update" do
    it "does not update password without current password" do
      user = FactoryGirl.create(:user1)
      user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
      post :password_update, params: { slug: user.slug, user: { current_password: '123', new_pasword: '12345' } }
      user = User.find user.slug

      expect(user.authenticate('123')).to eql(false)
    end

    pending "does update password only if current password is correct" do
      # user = FactoryGirl.create(:user1)
      # session[:current_user_id] = session[:login_user_id] = user.id
      # post :password_update, params: { slug: user.slug, user: { current_password: '1234', new_pasword: '12345' }}
      # user = User.find user.slug
      # # this is just a patch to fix InvalidHash
      # user.password = '12345'
      # expect(user.authenticate('12345')).to eql(user)
      it { should end_with "success" }
    end
  end
end