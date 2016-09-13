require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
  describe "GET #confirm_email" do
    it "confirms a user with a valid token" do
      registration = FactoryGirl.build(:user_registration_form)
      user = registration.submit
      get :confirm_email, params: { registration_id: user.confirmation_token }
      expect(true).to eql(true)
    end

    it "does not confirm a user with an invalid token" do
      registration = FactoryGirl.build(:user_registration_form)
      user = registration.submit
      get :confirm_email, params: { registration_id: user.confirmation_token + "invalid" }
      expect(false).to eql(false)
    end
  end

  describe "POST #confirm_user_company" do
    it "should not confirm user" do
      registration = FactoryGirl.build(:user_registration_form)
      user = registration.submit
      get :confirm_user_company, params: { registration_id: user.confirmation_token + "invalid", registration: {company_name: 'Testcompany'} },format: :js
      expect(false).to eql(false)
    end

    it "should not save company" do
      company = FactoryGirl.create(:company)
      registration = FactoryGirl.build(:user_registration_form)
      user = registration.submit
      get :confirm_user_company, params: { registration_id: user.confirmation_token, registration: {company_name: 'Company'} },format: :js
      user = User.find_by(id: user.id)
      expect(flash[:danger].blank?).to eql(false)
    end

    it "should save company and comfirmed user" do
      registration = FactoryGirl.build(:user_registration_form)
      user = registration.submit

      get :confirm_user_company, params: { registration_id: user.confirmation_token, registration: {company_name: 'Comapny'} },format: :js
      expect(flash[:success].blank?).to eql(false)
    end
  end
end
