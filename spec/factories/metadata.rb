FactoryGirl.define do
  factory :metadatum do
    company { Company.first || association(:company) }
    metadatum_type_id { MetadatumType.first&.id }
    name "test"
    default_value []
  end
end
