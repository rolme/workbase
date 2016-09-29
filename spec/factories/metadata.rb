FactoryGirl.define do
  factory :metadatum do
    company { Company.first || association(:company) }
    metadatum_type_id { MetadatumType.first&.id }
    label "test"
    default []
  end
end
