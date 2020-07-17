ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rspec'
require 'devise'
require 'factory_bot_rails'

require_relative 'support/controller_macros'

abort("The Rails environment is running in production mode!") if Rails.env.production?

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers

  Capybara.server = :puma # Until your setup is working
  Capybara.server = :puma, { Silent: true } # To clean up your test output

  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu window-size=1400,900])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.save_path = Rails.root.join('tmp/capybara')
  Capybara.javascript_driver = :headless_chrome

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.before(:all) do
    DatabaseCleaner.start
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
end
