require 'rails_helper'

RSpec.describe RegistrationForm, type: :model do
  let(:registration) { RegistrationForm.new }

  it 'should not save without an email' do
    params = {
      company_name: "",
      user_email: "register@testmail.com",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save without a password' do
    params = {
      company_name: "New Company",
      user_email: "register@testmail.com",
      password: ""
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save with an already existing company' do
    admin = FactoryGirl.create(:admin)

    params = {
      company_name: "Company",
      user_email: "register@testmail.com",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should not save with an already existing email' do
    admin = FactoryGirl.create(:admin, email: "new-test@testmail.com")

    params = {
      company_name: "Company",
      email: "new-test@testmail.com",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end

  it 'should save with a new company, email, and password' do
    params = {
      company_name: "Company",
      user_email: "register@testmail.com",
      password: "1234"
    }

    expect(registration.submit(params)).to eql(false)
  end
end
