FactoryGirl.define do
  factory :unit_type do
    company { Company.first || association(:company) }
    name "camera"
  end
end
