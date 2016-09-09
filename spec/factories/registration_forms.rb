FactoryGirl.define do
  factory :registration_form do
    email 'test-register@testemail.com'
    password '1234'
    name 'New Company'
  end

  factory :user_registration_form, class: RegistrationForm do
    email 'test-register@testemail.com'
    password '1234'
    password_confirmation '1234'
  end
end
