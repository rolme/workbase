ruby '2.3.0'

source 'https://rubygems.org' do
  gem 'rails', '~> 5.0.0'
  gem 'pg', '~> 0.18'
  gem 'puma', '~> 3.0'
  gem 'slim-rails'

  # User authorization and authentication
  gem 'pundit'
  gem 'bcrypt'
  gem 'rqrcode_png'

  # Image manipulation
  gem 'fog-aws'
  gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
  gem 'carrierwave-video-thumbnailer'
  gem 'mini_magick'

  # Email
  gem 'valid_email'

  # CSS
  gem 'sass-rails', '~> 5.0'
  gem 'bootstrap-sass'
  gem 'bootswatch-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'font-awesome-rails'

  # Javascript
  gem 'jquery-rails'
  gem 'jbuilder', '~> 2.5'
  gem 'select2-rails'

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
    gem 'parallel_tests'
    gem 'pry'
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'pry-remote'
    gem 'rspec-rails'
    gem 'capybara'
  end

  group :development do
    gem 'listen', '~> 3.0.5'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'web-console'
  end
end
