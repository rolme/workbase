class Company < ApplicationRecord
  has_many :areas
  has_many :users

  validates_uniqueness_of :name
end
