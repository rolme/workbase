ActionMailer::Base.default_url_options = {
  protocol: 'https',
  host: Rails.application.secrets.email_hostname
}

# class SandboxEmailInterceptor
#   def self.delivering_email(message)
#     return if message.to.first == Rails.application.secrets.exception_notification_email
#     default_email   = [Rails.application.secrets.mailer_default_source]
#     message.subject = "[To: #{message.to.join(', ')}; Cc: #{message.cc.join(', ')}; Bcc: #{message.bcc.join(', ')}] #{message.subject}"
#     message.to      = [default_email]
#     message.cc      = []
#     message.bcc     = []
#   end
# end
#
# Interceptor should be used for all environments except Production.
# ActionMailer::Base.register_interceptor(SandboxEmailInterceptor) unless Rails.env == 'production'
