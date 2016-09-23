class CompanyFeatureSetting < FeatureSetting
  belongs_to :company, foreign_key: :type_id
  belongs_to :feature, foreign_key: :feature_id
end
