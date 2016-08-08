class User < ApplicationRecord
  include Sluggable
  include SoftDeletable

  has_secure_password
  mount_uploader :avatar, AvatarUploader

  belongs_to :company

  validates_associated :company
  validates :email, uniqueness: true, email: true, domain: true
  validates :password, length: { minimum: 4 }, allow_nil: true

  delegate :name,
           to: :company,
           prefix: true

  before_create :set_confirmation_token

  def avatar?
    avatar.file.present?
  end

  def employee?
    type == 'WorkbaseEmployee'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def security_answer=(answer)
    self[:security_answer] = Digest::MD5.hexdigest(answer.to_s.downcase)
  end

  def security_answer_verified?(answer)
    security_answer == Digest::MD5.hexdigest(answer.downcase)
  end

private

  def set_confirmation_token
    if confirmation_token.blank?
      self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
