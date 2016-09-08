class LeadUserMailer < ApplicationMailer
  def confirmation_lead(user)
    @user = user
    mail(to: @user.email, subject: "Workbase: Please confirm your email address.")
  end
end
