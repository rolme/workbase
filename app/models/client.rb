class Client < ApplicationRecord
  include Sluggable
  include SoftDeletable
  
  before_create :confirmation_token
  
  belongs_to :company
  
  has_many :projects

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
            :confirmed,
            :confirmation_token,
            :infoconfirm,
            presence: true

  def contact_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state} #{zipcode}"
  end
  private
    def confirmation_token
      if confirmation_token.blank?
        self.confirmation_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
