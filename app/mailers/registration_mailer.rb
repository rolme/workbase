class RegistrationMailer < ApplicationMailer
  default from: 'bot@eworkbase.com'
  def confirmation(user)
    @user = user
    mail(to: @user.email, subject: "eWorkbase: Please confirm your email address.")
  end
end
