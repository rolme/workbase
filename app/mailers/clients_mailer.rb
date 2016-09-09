class ClientsMailer < ActionMailer::Base
  default from: 'no-reply@workbase.com'

  layout 'mailer'
  
  def confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Workbase: Please confirm your email address.")
  end
end
