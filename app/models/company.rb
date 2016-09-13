class Company < ApplicationRecord
  include SoftDeletable

  has_many :areas
  has_many :warehouses
  has_many :locations
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users
  has_many :client_types

  validates :name, uniqueness: true

  after_create :default_client_types


  private

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
end
