FactoryGirl.define do
  factory :company_status do
    label 'active'

    factory :system_company_status do
      label 'system'
    end

    factory :trial_company_status do
      label 'trial'
    end

    factory :inactive_company_status do
      label 'inactive'
    end
  end
end
