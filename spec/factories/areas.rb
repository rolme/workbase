FactoryGirl.define do
  factory :warehouse do
    company { Company.first || association(:company) }
    created_by { Admin.first || association(:admin) }
    name "Warehouse 1"
    street "123 Street"
    city "San Jose"
    state "CA"
    zipcode 95123
  end

  factory :location do
    warehouse { Warehouse.first || association(:warehouse) }
    company { Company.first || association(:company) }
    created_by { Admin.first || association(:admin) }
    name "Shelf 1"
  end
end
