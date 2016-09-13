require 'rails_helper'

RSpec.describe RegistrationForm, type: :model do
  let(:registration) { RegistrationForm.new }

  it 'should not save without an email' do
    params = {
      company_name: "",
      email: "",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save without a password' do
    params = {
      company_name: "New Company",
      email: "register@testmail.com",
      password: ""
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save with an already existing company' do
    admin = FactoryGirl.create(:admin)

    params = {
      company_name: "Company",
      email: "register@testmail.com",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save with an already existing email' do
    admin = FactoryGirl.create(:admin, email: "new-test@testmail.com")

    params = {
      company_name: "Company",
      email: "new-test@testmail.com",
      password: "1234",
      password_confirmation: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should save with a new company, email, and password' do
    params = {
      company_name: "Company",
      email: "register@testmail.com",
      password: "1234",
      password_confirmation: "1234"
    }

    expect(!!registration.submit(params)).to eql(true)
  end

  it 'should show that user is unconfirmed right after registering' do
    params = {
      company_name: "Company",
      email: "register@testmail.com",
      password: "1234",
      password_confirmation: "1234"
    }

    user = registration.submit(params)
    expect(user.confirmed).to eql(false)
  end

  it 'should set a confirmation token' do
    params = {
      company_name: "Company",
      email: "register@testmail.com",
      password: "1234",
      password_confirmation: "1234"
    }

    user = registration.submit(params)
    expect(user.confirmation_token).to_not be_blank
  end
end
