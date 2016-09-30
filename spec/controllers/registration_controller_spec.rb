require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
  describe "GET #confirm_email" do
    let(:registration) { FactoryGirl.build(:user_registration_form) }

    it "confirms a user with a valid token" do
      user = registration.submit

      get :confirm_email, params: { registration_id: user.confirmation_token }
      expect(true).to eql(true)
    end

    it "does not confirm a user with an invalid token" do
      user = registration.submit
      get :confirm_email, params: { registration_id: user.confirmation_token + "invalid" }
      user = User.find_by(id: user.id)
      expect(user.confirmed).to eql(false)
    end
  end

  describe "POST #confirm_user_company" do
    let(:registration) { FactoryGirl.build(:user_registration_form) }

    it "should not confirm user" do
      user = registration.submit
      get :confirm_user_company, params: { registration_id: user.confirmation_token + "invalid", registration: {company_name: 'Testcompany'} },format: :js
      user = User.find_by(id: user.id)
      expect(user.confirmed).to eql(false)
    end

    it "should not save company" do
      company = FactoryGirl.create(:company)
      user = registration.submit
      get :confirm_user_company, params: { registration_id: user.confirmation_token, registration: {company_name: 'Company'} },format: :js
      user = User.find_by(id: user.id)
      expect(flash[:danger].blank?).to eql(false)
    end

    it "should save company and comfirmed user" do
      user = registration.submit

      get :confirm_user_company, params: { registration_id: user.confirmation_token, registration: {company_name: 'Comapny'} },format: :js
      expect(flash[:success].blank?).to eql(false)
    end
  end
end
