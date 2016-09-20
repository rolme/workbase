FactoryGirl.define do
  factory :company do
    name 'Company'
    company_status { CompanyStatus.first || association(:company_status) }
  end
end
