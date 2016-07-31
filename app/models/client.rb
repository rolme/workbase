class Client < ApplicationRecord
  belongs_to :company

  has_many :projects

  scope :sorted, -> {
    order(:company_name, :first_name)
  }

  def contact_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state} #{zipcode}"
  end
end
