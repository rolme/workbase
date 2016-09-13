ruby '2.3.1'

source 'https://rubygems.org' do
  gem 'rails', '~> 5.0.0.1'
  gem 'pg', '~> 0.18'
  gem 'puma', '~> 3.0'
  gem 'slim-rails'
  gem 'newrelic_rpm'

  # helper gems
  gem 'ranked-model'

  # User authorization and authentication
  gem 'pundit'
  gem 'bcrypt'
  gem 'rqrcode_png'

  # Image manipulation
  gem 'fog-aws'
  gem 'carrierwave', git: 'git@github.com:carrierwaveuploader/carrierwave'
  gem 'carrierwave-video-thumbnailer'
  gem 'mini_magick'

  # WYSIWYG
  gem 'bootsy'

  # Email
  gem 'valid_email'

  # CSS
  gem 'sass-rails', '~> 5.0.6'
  gem 'bootstrap-sass'
  gem 'bootstrap-datepicker-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'font-awesome-rails'

  # Javascript
  gem 'jquery-rails'
  gem 'jbuilder', '~> 2.5'
  gem 'browserify-rails'
  gem 'select2-rails'
  gem 'chartkick'

  # Auditing
  gem 'paper_trail', '~> 5.2'

  # ActionCable
  gem 'redis'

  # for background job
  gem 'sidekiq'

  # for import contacts
  gem 'omnicontacts', git: 'git@github.com:rolme/omnicontacts.git'

  group :production do
    gem 'rails_stdout_logging'
    gem 'rails_12factor'
  end

  # Make this gem available on the console to support db
  # seeding and conversion
  gem "database_cleaner", group: [:development, :test, :console]
  gem "faker",            group: [:development, :test, :console]

  group :development, :test do
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'byebug', platform: :mri
    gem 'factory_girl_rails'
    gem 'letter_opener'
    gem 'parallel_tests'
    gem 'pry'
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'pry-remote'
    gem 'rspec-rails'
    gem 'selenium-webdriver'
    gem 'cucumber-rails', require: false
    gem 'capybara'
    gem "teaspoon-jasmine"
    gem "coffee-script"
    gem 'rails-controller-testing'
  end

  group :development do
    gem 'listen', '~> 3.0.5'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'web-console'
  end
end
