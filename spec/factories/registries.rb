FactoryGirl.define do
  factory :registry do
    label "MyString"
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end

  factory :client_type, class: ClientType do
    label "Lead"
    company { Company.last || association(:company) }
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end

  factory :metadatum_type, class: MetadatumType do
    label "textfield"
    company { Company.last || association(:company) }
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end
end
