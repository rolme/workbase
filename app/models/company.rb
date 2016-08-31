class Company < ApplicationRecord
  include SoftDeletable

  has_many :areas
  has_many :warehouses
  has_many :locations
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users

  validates :name, uniqueness: true
end
