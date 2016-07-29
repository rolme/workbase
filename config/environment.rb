# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.default_url_options[:host] = Rails.application.secrets.hostname
