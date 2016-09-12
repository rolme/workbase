class Client < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :company

  has_many :projects
  has_many :encounters

  scope :sorted, -> {
    order(:company_name, :first_name)
  }

  validates :city,
            :email,
            :first_name,
            :last_name,
            :phone,
            :state,
            :street,
            :zipcode,
            presence: true

  def contact_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state} #{zipcode}"
  end
end
