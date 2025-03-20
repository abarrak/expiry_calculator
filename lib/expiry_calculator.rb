# frozen_string_literal: true

require_relative "expiry_calculator/logic"
require_relative "expiry_calculator/version"

module ExpiryCalculator
  include ExpiryCalculator::Logic
end
