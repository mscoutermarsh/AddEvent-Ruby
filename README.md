# AddThisEvent Ruby API Client

:construction: Work in progress, don't use me yet! :warning:

![AddThisEvent Ruby API Client](https://raw.githubusercontent.com/mscoutermarsh/AddThisEvent-Ruby/master/addthisevent-ruby.png)

[![Build Status](https://travis-ci.org/mscoutermarsh/AddThisEvent-Ruby.svg)](https://travis-ci.org/mscoutermarsh/AddThisEvent-Ruby) [![Code Climate](https://codeclimate.com/github/mscoutermarsh/AddThisEvent-Ruby/badges/gpa.svg)](https://codeclimate.com/github/mscoutermarsh/AddThisEvent-Ruby) [![Test Coverage](https://codeclimate.com/github/mscoutermarsh/AddThisEvent-Ruby/badges/coverage.svg)](https://codeclimate.com/github/mscoutermarsh/AddThisEvent-Ruby/coverage) [![security](https://hakiri.io/github/mscoutermarsh/AddThisEvent-Ruby/master.svg)](https://hakiri.io/github/mscoutermarsh/AddThisEvent-Ruby/master)

Ruby client for the AddThisEvent.com API :zap: :smiley:.

Makes it super easy to create AddThisEvent URL's from Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'add_this_event'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install add_this_event

## Usage

You'll need an **AddThisEvent premium account** to use the API (sign up here: [addthisevent.com](https://addthisevent.com)). 

Once you have a premium account, you'll need to set your `client_id` in either an initializer (Rails), or by passing it as an `option` each time when creating a new event URL.
```Ruby
# config/initializers/add_this_event.rb
AddThisEvent.configuration do |config|
  # Your Client ID (License code) is available here: https://addthisevent.com/account/
  config.client_id = 'your_id_goes_here' 
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing :heart:

Want to make this better? Great! :smile:  

Bug reports and pull requests are welcome on GitHub at https://github.com/mscoutermarsh/AddThisEvent-Ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

