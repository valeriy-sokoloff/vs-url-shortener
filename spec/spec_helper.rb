require 'database_cleaner'
require 'factory_girl'
require 'support/factory_girl'
require 'ffaker'

DatabaseCleaner[:active_record].strategy = :transaction
DatabaseCleaner.strategy = :transaction

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
