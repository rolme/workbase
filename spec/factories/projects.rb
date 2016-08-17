FactoryGirl.define do
  factory :project do
    company { Company.first || association(:company) }
    client { Client.first || association(:client) }
    name "Installation"
    start_date { Date.current + 14.days }
    end_date { Date.current + 17.days }
    project_status { ProjectStatus.first || association(:project_status) }
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
