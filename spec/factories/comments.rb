FactoryGirl.define do
  factory :comment do
    title "MyString"
    content "MyText"
    ticket_id 1
    user_id 1
    public 1
  end
end
