## Clark Event Bus

* Exposes aditional methods (trigger and on) for messaging features for events
that may occurr on Clark Bank Applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clark_event_bus'
```

Or install it yourself as:

gem install clark_event_bus
```

## Usage

### Emitter
``ruby
emitter = Clark::EventBus::Emitter.new(options)
routing_key = 'user.registered'
payload = {email: 'foo@mail.com'}.to_json
emitter.trigger(payload, routing_key)
```

### Listener
``ruby
listener = Clark::EventBus::Listener.new(options)
listener.on("user.registered") do |event|
end
```

## Contributing
- Fork it
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create new Pull Request

## Badges

[![CircleCI](https://circleci.com/gh/ClarkBank/clark_event_bus.svg?style=svg)](https://circleci.com/gh/ClarkBank/clark_event_bus)
[![Code Climate](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/gpa.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror)
[![Test Coverage](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/coverage.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror/coverage)
[![Issue Count](https://codeclimate.com/github/rafaeljesus/bank_ror/badges/issue_count.svg)](https://codeclimate.com/github/rafaeljesus/bank_ror)

---

> GitHub [@rafaeljesus](https://github.com/rafaeljesus) &nbsp;&middot;&nbsp;
> Twitter [@rafaeljesus](https://twitter.com/_jesus_rafael)
