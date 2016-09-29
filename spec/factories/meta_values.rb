FactoryGirl.define do
  factory :meta_value do
    client { Client.first || association(:client) }
    metadatum { Metadatum.first || association(:metadatum) }
    field_value "MyString"
    deleted_at "2016-09-26 15:46:44"
  end
end
