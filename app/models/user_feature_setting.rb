class UserFeatureSetting < FeatureSetting
  belongs_to :user, foreign_key: :type_id
  belongs_to :feature, foreign_key: :feature_id
end
