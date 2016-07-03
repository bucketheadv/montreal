# Montreal

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/montreal`. To experiment with that code, run `bin/console` for an interactive prompt.

`montreal` is a gem to use redis cache with connection pool.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'montreal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install montreal

## Usage

```ruby
rails g montreal:install CONFIG_NAME
```

This will generate two files named `config/CONFIG_NAME.yml` and `config/initializers/CONFIG_NAME.rb`.

You can see that there is a config for redis in your `config/CONFIG_NAME.yml` named `cache`, this will generate a method in the class `Montreal`, so you can use the code `Montreal.cache` to return a redis connection pool.

If you are trying to get a connection, try that `Montreal.cache.with { |cli| ... }`, the `cli` is a connection that you can use.

Also you can add more config in `config/CONFIG_NAME.yml`, only to ensure that the format is like `cache`, you can also configure nothing about host, port and so on, but you should finger out a connection pool name like `cache` to generate a method `Montreal.YOUR_CONNECTION_POOL`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sven199109/montreal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

