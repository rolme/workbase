require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }

  it "Should not save without an email" do
    user.email = ""
    expect(user.save).to eql(false)
  end

  it "Should not save without a company" do
    user.password = user.password_confirmation = ""
    expect(user.save).to eql(false)
  end

  it "Should not save without a password" do
    user.company = nil
    expect(user.save).to eql(false)
  end

  it "Should save with an email, a company, and password" do
    user.company = FactoryGirl.build(:company)
    expect(user.save).to eql(true)
  end
end
