class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@workbase.com'

  layout 'mailer'
end
