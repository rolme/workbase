class RegistrationMailer < ApplicationMailer
  def confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Workbase: Please confirm your email address.")
  end
end
