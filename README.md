# Expiry Calculator

[![Gem Version](https://badge.fury.io/rb/expiry_calculator.svg)](https://rubygems.org/gems/expiry_calculator)
[![Build](https://github.com/abarrak/expiry_calculator/actions/workflows/ci.yml/badge.svg)](https://github.com/abarrak/expiry_calculator/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


A ruby library that determines how much time left till certain date and time.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add expiry_calculator
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install expiry_calculator
```

## Usage

Add the library if gem auto loading is not available.

```ruby
require "expiry_calculator"
```

You can use the the extendable module method:

```ruby
ExpiryCalculator.calculate(2025, 10, 10)
# => 201
```

Or mix in to use the calcuate function directly:

```ruby
include ExpiryCalculator

calculate Date.new(2025, 10, 10)
# => 201
```

```ruby
calculate "2025-01-10"
# => 0
```

Active record models and be called with the date field needed to calculate:

```ruby
user = User.first
calculate user, :birth_day
# => 15
```


The supported objects:

- `Date`
- `DateTime`
- `string`: attempted to be parsed as datetime object.
- `ActiveRecord`: given an attribute of of the model to read as date object.

## API Docs

The gem specs can [be found at RubyDocs.](https://www.rubydoc.info/gems/expiry_calculator)

## Contributing

Bug reports and pull requests are welcome [on GitHub](https://github.com/abarrak/expiry_calculator).
