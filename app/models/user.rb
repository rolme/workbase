class User < ApplicationRecord
  belongs_to :company

  has_secure_password

  validates :password, length: { minimum: 4 }, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
