class UserMailer < ActionMailer::Base
  default from: 'no-reply@workbase.com'

  layout 'mailer'

  def password_changed(id)
    @user = User.find_by_id(id)
    mail to: @user.email, subject: "Your password has changed"
  end
end
