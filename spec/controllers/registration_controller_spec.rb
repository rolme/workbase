require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
  describe "GET #confirm_email" do
    it "confirms a user with a valid token" do
      registration = FactoryGirl.build(:registration_form)
      user = registration.submit
      get :confirm_email, params: { registration_id: user.confirmation_token }
      user = User.find user.id
      expect(user.confirmed).to eql(true)
    end

    it "does not confirm a user with an invalid token" do
      registration = FactoryGirl.build(:registration_form)
      user = registration.submit
      get :confirm_email, params: { registration_id: user.confirmation_token + "invalid" }
      user = User.find user.id
      expect(user.confirmed).to eql(false)
    end
  end
end
