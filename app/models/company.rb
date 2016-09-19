class Company < ApplicationRecord
  include SoftDeletable

  has_many :areas
  has_many :clients
  has_many :locations
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users
  has_many :warehouses
  has_many :client_types

  validates :name, uniqueness: true

  after_create :default_client_types

  before_validation(on: :create) do
    default_company_name
  end

  private

  # assign default company name
  def default_company_name
    self.name = random_name if name.blank?
  end

  # create labels for company clients 
  def default_client_types
    self.client_types.create([
      { label: 'lead' },
      { label: 'prospect' },
      { label: 'qualified' },
      { label: 'potential' },
      { label: 'customer' },
    ])
  end
  
  def random_name
    (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
