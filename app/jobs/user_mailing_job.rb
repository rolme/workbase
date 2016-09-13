class UserMailingJob < ActiveJob::Base

  def perform(token, email)
    UserMailer.reset_password_instructions(token, email).deliver
  end
end
