# frozen_string_literal: true
require 'date'
require_relative "lib/expiry_calculator/version"

Gem::Specification.new do |spec|
  spec.name    = "expiry_calculator"
  spec.version = ExpiryCalculator::VERSION
  spec.date    = Date.today.to_s
  spec.authors = ["Abdullah Barrak"]
  spec.email   = ["abdullah@abarrak.com"]

  spec.summary = "Determines how much time left till certain date."
  spec.description = "The library provides functionality to calculate the expiration from different dates and time objects."
  spec.required_ruby_version = ">= 3.1.0"
  spec.homepage      = "https://rubygems.org/gems/expiry_calculator"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abarrak/expiry_calculator"
  spec.metadata["changelog_uri"] = "https://github.com/abarrak/expiry_calculator/blob/main/CHANGELOG.md"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github Gemfile])
    end
  end

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.bindir = "exe"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "factory_bot", "~> 6.2"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "activesupport"
end
