FactoryGirl.define do
  factory :unit_category do
    company { Company.first || association(:company) }
    label "camera"
  end
end
