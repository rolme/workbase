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

  context '#send_reset_password_instructions' do
    it "sends an password reset instructions" do
      expect { user.send_reset_password_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  context '#set_new_password' do
    it "Should not set password" do
      expect(user.set_new_password({new_password: 'demo',  password_confirmation: 'demo', reset_password_token: '23452345234'}) ).to eql(nil)
    end

    it "Should set password" do
      token = Digest::MD5.hexdigest(user.email)
      user.update(reset_password_token: token)
      attributes = {new_password: 'demo',  password_confirmation: 'demo', reset_password_token: token}
      user.set_new_password(attributes)
      expect( user.authenticate('demo').blank? ).to eql(false)
    end
  end
end
