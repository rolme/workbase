require 'rails_helper'

RSpec.describe Section, type: :model do
  let(:section) { FactoryGirl.build(:section) }

  context '#style' do
    it "should return SectionType#label" do
      expect(section.style).to eql(section.section_type_label)
    end
  end
end
