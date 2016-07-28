RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation

    # TODO: If things get slow, consider...
    # DatabaseCleaner.strategy = :truncation, {
    #   except: %w(
    #     metadata
    #     approval_statuses
    #     approval_types
    #     roles
    #   )
    # }
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
