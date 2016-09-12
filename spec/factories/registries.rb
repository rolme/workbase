FactoryGirl.define do
  factory :registry do
    label "MyString"
    position "MyString"
    deleted_at "2016-08-03 20:42:06"
  end

  factory :encounter_type do
    label "MyString"
    position "MyString"
    type "EncounterType"
    deleted_at "2016-08-03 20:42:06"
  end
end
