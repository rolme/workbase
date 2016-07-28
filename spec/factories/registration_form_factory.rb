FactoryGirl.define do
  factory :registration_form do
    user_email 'test-register@testemail.com'
    user_password '1234'
    company_name 'New Company'
  end
end
