[ ![Codeship Status for krisquigley/electio](https://codeship.com/projects/ed079000-28b8-0134-2981-5a347c0ad183/status?branch=master)](https://codeship.com/projects/162454)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/190a59a3d8304df09fa85150fec5136d)](https://www.codacy.com/app/kris_4/electio?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=krisquigley/electio&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/190a59a3d8304df09fa85150fec5136d)](https://www.codacy.com/app/kris_4/electio?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=krisquigley/electio&amp;utm_campaign=Badge_Coverage)

# electio
Ruby gem for the electio API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'electio'
```

## Basic usage

```ruby
require 'electio'

Electio.configure do |config|
  config.api_key = ENV['API_KEY'] # Your Primary or Secondary developer API key.
end
```

## Querying an endpoint

Summary of a specific consignment:
```ruby
consignment_reference = 'EC-XXX-XXX-XXX'
consignment = Electio::Consignment.find(consignment_reference) #=> Returns response as an object.

```

Creating a consignment:
```ruby
consignment_params = { ... }
consignment = Electio::Consignment.new(consignment_params)
consignment.save #=> Returns response as an object
```

## Todo

- Error handling
- Implement 100% of API

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krisquigley/electio.


