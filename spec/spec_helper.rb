require 'rails_helper'

include Warden::Test::Helpers

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after :each do
    Warden.test_reset!
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end