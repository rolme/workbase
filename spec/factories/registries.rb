FactoryGirl.define do
  factory :registry do
    label "MyString"
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end

  factory :client_type, class: ClientType do
    label "Lead"
    company_id Company.last
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end
end
