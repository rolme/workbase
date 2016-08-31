FactoryGirl.define do
  factory :proposal_status do
    label 'draft'
    company { Company.first || association(:company) }
  end
end
