FactoryGirl.define do
  factory :warehouse do
    name "Warehouse 1"
    street "123 Street"
    city "San Jose"
    state "CA"
    zipcode 95123
  end

  factory :location do
    name "Shelf 1"
  end
end
