# PayMaya-Rails
PayMaya API wrapper for Ruby on Rails Applications

## Usage
```ruby
# Depedends on the api needs if its the public_key or secret_key
client = PayMaya::API::Client.new(secret_key: secret_key)
api = PayMaya::API::Endpoint::Payment::GetRRN.new(rrn: request_reference_number)
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

## Endpoints
- [x] Create Checkout Payment
- [x] Get Checkout
- [x] Get Payments via RRN
- [ ] Void by ID
- [ ] Get Voids
- [ ] Refund by ID
- [ ] Get Refunds
- [ ] Create Webhook
- [ ] Delete Webhook
- [ ] Create / Update Customization
- [ ] Delete Customization
- [ ] Capture

Refs: [PayMaya Checkout Documentation](https://hackmd.io/@paymaya-pg/Checkout)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/mcdave029/PayMaya-Rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
