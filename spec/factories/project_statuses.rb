FactoryGirl.define do
  factory :project_status do
    label 'active'
    company { Company.first || association(:company) }
  end
end
