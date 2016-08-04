require 'rails_helper'

RSpec.describe Section, type: :model do
  let(:section) { FactoryGirl.build(:section) }

  context '#create' do
    it "should set cache" do
      expect(section.style).to_not eql(nil)
    end
  end
end
