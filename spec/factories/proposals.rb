FactoryGirl.define do
  factory :proposal do
    project { Project.first || association(:project) }
    company { Company.first || association(:company) }
    created_by { User.first || association(:user) }
    updated_by { User.first || association(:user) }
    title "Proposal Title"
    proposal_status { ProposalStatus.first || association(:proposal_status) }
  end
end
