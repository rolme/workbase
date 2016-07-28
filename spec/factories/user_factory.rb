FactoryGirl.define do
  factory :user do
    email 'test@testemail.com'
    first_name 'First'
    last_name 'Last'
    password '1234'
    password_confirmation '1234'

    factory :admin do
      first_name 'Company'
      last_name 'Admin'
      company
    end
  end
end
