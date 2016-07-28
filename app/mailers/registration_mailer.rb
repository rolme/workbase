class RegistrationMailer < ApplicationMailer
  def confirmation(user)
    @user = user
    mail(to: [user.email], cc: [], bcc: [], subject: "Workbase: Please confirm your email address.")
  end
end
