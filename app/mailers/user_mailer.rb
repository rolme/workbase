class UserMailer < ActionMailer::Base
  default from: 'no-reply@workbase.com'

  layout 'mailer'

  def password_changed(id)
    @user = User.find_by_id(id)
    mail to: @user.email, subject: "Your password has changed"
  end

  def email_changed(id, email_was)
    @user = User.find_by_id(id)
    mail to: email_was, subject: "Your email has changed"
  end

  def info_changed(id, info)
    @user = User.find_by_id(id)
    @info = info
    mail to: @user.email, subject: "Your #{@info} has changed"
  end
end
