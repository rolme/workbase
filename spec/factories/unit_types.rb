FactoryGirl.define do
  factory :unit_type do
    company { Company.first || association(:company) }
    label "camera"
  end
end
