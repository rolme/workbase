class User < ApplicationRecord
  include Sluggable
  include SoftDeletable

  attr_accessor :current_password, :new_password

  has_secure_password
  mount_uploader :avatar, AvatarUploader

  belongs_to :company
  belongs_to :security_question, optional: true
  has_many :comments

  validates_associated :company
  validates :email, uniqueness: true, email: true, domain: true
  validates :password, length: { minimum: 4 }, allow_nil: true
  validate :validate_current_password, if: :current_password

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

  def validate_current_password
    if authenticate(current_password)
      self.password = new_password
    else
      errors.add(:current_password, "is invalid.")
    end
  end

end
