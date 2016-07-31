FactoryGirl.define do
  factory :project do
    company { Company.first || association(:company) }
    client { Client.first || association(:client) }
    name "Installation"
    start_date "2016-07-30 13:29:36"
    end_date "2016-07-30 13:29:36"
    summary "Summary text goes here."
    labor "Labor text goes here."
  end

  trait :with_units do
    transient do
      unit_count 2
    end

    after :create do |project, evaluator|
      FactoryGirl.create_list :unit, evaluator.unit_count, project: project
    end
  end

  trait :with_random_units do
    transient do
      unit_count 2
    end

    after :create do |project, evaluator|
      FactoryGirl.create_list :random_unit, evaluator.unit_count, project: project
    end
  end
end
