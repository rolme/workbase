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

  context '.create' do
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

  context '#security_answer_verified?' do
    it 'should return true if matches existing security answer' do
      answer = 'This is the Answer.'
      user.security_answer = answer
      expect(user.security_answer_verified?(answer)).to eql(true)
    end
  end

  context '#security_answer' do
    it 'should return a hash and not the answer' do
      answer = 'This is the Answer.'
      user.security_answer = answer
      expect(user.security_answer).to_not eql(answer)
    end
  end
end
