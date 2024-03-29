FactoryGirl.define do
  factory :unit do
    company { Company.first || association(:company) }
    unit_category
    manufacturer "manufacturer"
    procurement_status "ordering"
    model "01-model-A"
    description "This is a description for contractors."
    client_description "This is a description for clients."
    cost 9.99

    factory :random_unit do
      sequence(:manufacturer) { |n| "manufacturer ##{n}"}
      cost Faker::Commerce.price
    end

    trait :with_project do
      project { Project.first || association(:project) }
    end
  end
end
