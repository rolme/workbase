class Feature < ApplicationRecord
  include SoftDeletable

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :monthly_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
