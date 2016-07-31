FactoryGirl.define do
  factory :user do
    email 'test-user@testemail.com'
    first_name 'First'
    last_name 'Last'
    password '1234'
    password_confirmation '1234'
    company { Company.first || association(:company) }
  end

  factory :admin do
    email 'test-admin@testemail.com'
    first_name 'Company'
    last_name 'Admin'
    password '1234'
    password_confirmation '1234'
    company { Company.first || association(:company) }
  end
end
