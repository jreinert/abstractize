# Abstractize

[![Build Status](https://travis-ci.org/jreinert/abstractize.svg?branch=development)](https://travis-ci.org/jreinert/abstractize)

A simple mixin for abstract class functionality in ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abstractize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abstract

## Usage

``` ruby
require 'abstractize'

class Vehicle
  include Abstractize

  attr_reader :wheels, :mileage
  def initialize(wheels=4)
    @mileage = 0
    @wheels = wheels
  end

  define_abstract_method :drive
end
```

``` ruby
class Car < Vehicle
end
```

``` ruby
class Tricycle < Vehicle
  def initialize
    super(3)
  end

  def drive
    @mileage += 0.01
  end
end
```

``` ruby
vehicle = Vehicle.new(2)
# AbstractError: cannot instanciate Vehicle
car = Car.new
# => #<Car:0x007f5e130631f0 @mileage=0, @wheels=4>
car.drive
# AbstractError: not implemented
tricycle = Tricycle.new
# => #<Tricycle:0x007f5e13093148 @mileage=0, @wheels=3>
tricycle.drive
# => 0.01
tricycle.drive
# => 0.02
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/abstract/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
