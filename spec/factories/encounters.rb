FactoryGirl.define do
  factory :encounter do
    client { Client.first || association(:client) }
    user { User.first || association(:user) }
    encounter_type_id {EncounterType.first || association(:encounter_type) }
    notes "MyText"
    encounter_date "2016-09-12"
    duration 1
  end
end
