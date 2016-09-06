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
  after_update :send_password_change_email, if: :needs_password_change_email?
  after_update :send_email_change_email, if: :needs_email_change_email?
  after_update :send_info_change_email, if: :needs_info_change_email?


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

  def get_logo_name
    self.first_name[0].capitalize + self.last_name[0].capitalize if(self.first_name.present? && self.last_name.present? )
  end

  def admin?
    self.type == "Admin"
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

  # check if password changed
  def needs_password_change_email?
    password_digest_changed? && persisted?
  end

  # send email when password changed
  def send_password_change_email
    UserMailer.password_changed(id).deliver
  end

  # check if email changed
  def needs_email_change_email?
    email_changed? && persisted?
  end

  # send email when email changed
  def send_email_change_email
    UserMailer.email_changed(id, email_was).deliver
  end

  #check if other info changed
  def needs_info_change_email?
    (phone_changed? || avatar_changed? || security_question_id_changed? || security_answer_changed?) && persisted?
  end

  # send email when info changed
  def send_info_change_email
    UserMailer.info_changed(id, change_information_for).deliver
  end

  def change_information_for
    if security_question_id_changed?
      'security question'
    elsif security_answer_changed?
      'security answer'
    elsif phone_changed?
      'phone number'
    elsif avatar_changed?
      'profile image'
    end
  end
end
