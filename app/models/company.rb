class Company < ApplicationRecord
  has_many :areas
  has_many :warehouses
  has_many :locations
  has_many :units
  has_many :users

  validates_uniqueness_of :name
end
