require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryGirl.build(:company) }

  it 'does not allow duplicate companies' do
    company.save
    new_company = FactoryGirl.build(:company)
    expect(new_company.save).to eq(false)
  end
end
