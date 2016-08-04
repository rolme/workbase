FactoryGirl.define do
  factory :proposal_status do
    label 'Draft'
    company { Company.first || association(:company) }
  end
end
