require 'rails_helper'

RSpec.describe Unit, type: :model do
  let(:company)   { FactoryGirl.create(:company) }
  let(:unit_category) { FactoryGirl.create(:unit_category) }
  let(:location)  { FactoryGirl.create(:location) }
  let(:unit) do
    Unit.new(
      company: company,
      unit_category: unit_category,
      cost: 45.2,
      manufacturer: "manufacturer"
    )
  end

  it "Should not save without a cost" do
    unit.cost = ""
    expect(unit.save).to eql(false)
  end

  it "Should not save without a manufacturer" do
    unit.manufacturer = ""
    expect(unit.save).to eql(false)
  end

  it "Should save with cost and manufacturer" do
    expect(unit.save).to eql(true)
  end

  context 'with location_required? set to true' do
    it "Should not save without a location" do
      unit.location_required = true
      unit.location = nil
      expect(unit.save).to eql(false)
    end

    it "Should not save with cost, manufacturer, and location" do
      unit.location_required = true
      unit.location = location
      expect(unit.save).to eql(true)
    end
  end
end
