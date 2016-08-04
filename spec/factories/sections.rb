FactoryGirl.define do
  factory :section do
    proposal { Proposal.first || association(:proposal) }
    section_type { SectionType.first || association(:section_type) }
    data "My data stuffs"
  end
end
