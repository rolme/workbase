require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      email: 'test-user@testcompany.com',
      password: '1234',
      password_confirmation: '1234',
      company: FactoryGirl.build(:company)
    )
  end

  it "Should not save without an email" do
    user.email = ""
    expect(user.save).to eql(false)
  end

  it "Should not save without a password" do
    user.password = user.password_confirmation = ""
    expect(user.save).to eql(false)
  end

  it "Should save with an email, a company, and password" do
    expect(user.save).to eql(true)
  end
end
