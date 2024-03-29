FactoryGirl.define do
  factory :client do
    client_type { ClientType.first || association(:client_type) }
    company { Company.first || association(:company) }
    company_name "Client Company"
    street "123 Client St"
    city "Client City"
    state "CA"
    zipcode "55555"
    email "contact-email@clientcompany.com"
    first_name "Client"
    last_name "Contact"
    phone "12345678"
    fax "5555555555"
  end
end
