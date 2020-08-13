# PayMaya-Rails
PayMaya API wrapper for Ruby on Rails Applications

## Usage
```ruby
# Depedends on the api needs if its the public_key or secret_key
client = PayMaya::API::Client.new(key: key)
api = PayMaya::API::Endpoint::PaymentsRRN.new(rrn: request_reference_number)
client.get(api: api) # This will produce Response
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'paymaya', git: 'https://github.com/mcdave029/PayMaya-Rails'
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
