class LeadUser < ApplicationRecord
  include SoftDeletable
  attr_accessor :email
  validates :email, uniqueness: true, email: true, domain: true
  before_create :confirmation_token
  def email_activate
    self.confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end  
  private
    def confirmation_token
      if confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
