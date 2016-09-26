class Client < ApplicationRecord
  include Sluggable
  include SoftDeletable

  attr_accessor :metadata

  belongs_to :company
  belongs_to :client_type

  has_many :projects
  has_many :encounters
  has_many :meta_values, dependent: :destroy
  has_many :text_values, dependent: :destroy

  scope :sorted, -> {
    order(:company_name, :first_name)
  }

  before_validation(on: :create) do
    default_client_type
  end

  before_create :save_meta_value
  before_update :update_meta_value

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

  def meta_field_value(metadatum_id)
    meta_values.find_by(metadatum_id: metadatum_id)&.value
  end
private

  def default_client_type
    self.client_type = ClientType.default
  end

  # save meta value with client 
  def save_meta_value
    company.metadata.each do |md|
      case md.metadatum_type&.label
      when 'select'
      when 'text'
        meta_value = text_values.new(metadatum_id: md.id, text_value: metadata[md.name])
      when 'string'
      end
    end
  end

  def update_meta_value
  end
end
