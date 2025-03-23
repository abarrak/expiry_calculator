# frozen_string_literal: true

require "simplecov"
require_relative "support/coverage"

SimpleCovHelper.configure_formatter
SimpleCov.start

require "expiry_calculator"
require "active_support"
require "active_support/core_ext/date/calculations"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
