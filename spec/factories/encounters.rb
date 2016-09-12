FactoryGirl.define do
  factory :encounter do
    client_id 1
    user_id 1
    encounter_type_id EncounterType.first
    notes "MyText"
    encounter_date "2016-09-12"
    duration 1
  end
end
