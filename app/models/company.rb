class Company < ApplicationRecord
  include SoftDeletable

  has_many :areas
  has_many :warehouses
  has_many :locations
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users
  has_many :settings, class_name: CompanyFeatureSetting, foreign_key: :type_id
  has_many :features, through: :settings, source: :feature

  validates :name, uniqueness: true
end
