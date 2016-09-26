class Company < ApplicationRecord
  include SoftDeletable

  belongs_to :company_status, optional: true

  has_many :areas
  has_many :clients
  has_many :features, through: :settings, source: :feature
  has_many :locations
  has_many :settings, class_name: CompanyFeatureSetting, foreign_key: :type_id
  has_many :tickets
  has_many :unit_categories
  has_many :units
  has_many :users
  has_many :warehouses
  has_many :metadata

  validates :name, uniqueness: true

  before_validation(on: :create) do
    default_company_name
    default_company_status
  end

  private

  def default_company_status
    self.company_status = CompanyStatus.default if company_status_id.blank?
  end

  # assign default company name
  def default_company_name
    self.name = random_name if name.blank?
  end

  def random_name
    (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
