# Expiry Calculator

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

Mix in or use directly the calcuate function:

```ruby
include ExpiryCalculator

calculate Date.new(2025, 10, 10)
```

The supported objects:

- `Date`
- `DateTime`
- `string`: attempted to be parsed as datetime object.
- `ActiveRecord`: given an attribute of of the model to read as date object.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abarrak/expiry_calculator.
