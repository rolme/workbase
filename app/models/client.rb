class Client < ApplicationRecord
  include Sluggable
  include SoftDeletable
  include Metadatable

  belongs_to :company
  belongs_to :client_type

  has_many :projects
  has_many :encounters

  scope :sorted, -> {
    order(:company_name, :first_name)
  }

  before_validation(on: :create) do
    default_client_type
  end

  validates :city,
            :email,
            :first_name,
            :last_name,
            :phone,
            :state,
            :street,
            :zipcode,
            presence: true

  # delegate :id,             # client_type_id
  #          :label,          # client_type_label
  #          to: :client_type,
  #          prefix: true

  def contact_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state} #{zipcode}"
  end

private

  def default_client_type
    self.client_type = ClientType.default
  end
end
