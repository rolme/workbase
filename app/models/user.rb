class User < ApplicationRecord
  include SoftDeletable

  has_secure_password

  belongs_to :company

  validates_associated :company
  validates :email, uniqueness: true, email: true, domain: true
  validates :password, length: { minimum: 4 }, allow_nil: true

  delegate :name,
           to: :company,
           prefix: true

  before_create :set_confirmation_token

  def is_employee?
    type == 'WorkbaseEmployee'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

private

  def set_confirmation_token
    if confirmation_token.blank?
      self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
