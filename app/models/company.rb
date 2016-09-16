class Company < ApplicationRecord
  include SoftDeletable

  has_many :areas
  has_many :warehouses
  has_many :locations
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users
  has_many :clients

  validates :name, uniqueness: true
  
  before_validation(on: :create) do
    default_company_name
  end

  private

  # assign default company name
  def default_company_name
    self.name = random_name if name.blank?
  end

  def random_name
    (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
