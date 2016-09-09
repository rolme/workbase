class Client < ApplicationRecord
  include Sluggable
  include SoftDeletable

  belongs_to :company
  belongs_to :client_type

  has_many :projects

  scope :sorted, -> {
    order(:company_name, :first_name)
  }

  before_create :client_type_deault

  validates :city,
            :email,
            :first_name,
            :last_name,
            :phone,
            :state,
            :street,
            :zipcode,
            presence: true

  delegate :id,             # client_type_id
           :label,          # client_type_label
           to: :client_type,
           prefix: true

  def contact_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state} #{zipcode}"
  end

  private

    # default client type
    def client_type_deault
      self.client_type = ClientType.find_by(label: 'lead')
    end
end
