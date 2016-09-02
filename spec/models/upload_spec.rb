require 'rails_helper'

RSpec.describe Upload, type: :model do
  it "Should not associate with unit" do
    unit = FactoryGirl.create(:unit)
    expect(Upload.associate_with_unit(100, unit.id)).to eql(nil)
  end

  it "Should associate with unit" do
    upload = FactoryGirl.create(:upload)
    unit = FactoryGirl.create(:unit)
    expect(Upload.associate_with_unit(upload.id, unit.id)).to eql(true)
  end
end
