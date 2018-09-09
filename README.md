[![CircleCI](https://circleci.com/gh/victorhazbun/simple_math.svg?style=svg)](https://circleci.com/gh/victorhazbun/simple_math) [![Coverage Status](https://coveralls.io/repos/github/victorhazbun/simple_math/badge.svg?branch=master)](https://coveralls.io/github/victorhazbun/simple_math?branch=master) [![Gem Version](https://badge.fury.io/rb/simple_math.svg)](https://badge.fury.io/rb/simple_math)
# SimpleMath

A simple math gem which provides a set of tools for math operations,
currently you can play with a very basic calculator.
See the [TODO](#todo) section for nice to have features.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_math'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_math

## Usage

### Calculator

The following will resolve ((((5 + 3) - 2) * 4) / 2)

```ruby
result = SimpleMath::Calculator.run(start: 5) do |dc|
  dc[:+][3]
  dc[:-][2]
  dc[:*][4]
  dc[:/][2]
end

p result #=> 12.0
```

But you can also do this, which is very cool

```ruby
object = Struct.new(:operation, :number) }
objects =
  [
    object.new(:+, 3),
    object.new(:-, 2),
    object.new(:*, 4),
    object.new(:/, 2)
  ]
result = SimpleMath::Calculator.run(start: 5) do |dc|
  objects.each do |o|
    dc[o.operation][o.number]
  end
end

p result #=> 12.0
```

The `+start+` argument is completely optional and by default is `0`

```ruby
result = SimpleMath::Calculator.run do |h|
  h[:+][3]
end

p result #=> 3
```

## TODO

- Implement more basic functions to the `Calculator`
- Implement complex math operations
- Refactor the DSL so Rubocop does not complains about big `&blocks`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[username]/simple_math. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleMath project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[username]/simple_math/blob/master/CODE_OF_CONDUCT.md).

[username]: victorhazbun
