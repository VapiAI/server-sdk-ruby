# Vapi Ruby Library

[![Gem Version](https://img.shields.io/badge/vapi-server-sdk-v0.0.3-red?logo=ruby)](https://rubygems.org/gems//vapi-server-sdk)

The Vapi Ruby library provides access to the Vapi API from Ruby.

## Documentation

API reference documentation is available [here](https://docs.vapi.ai/).

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
bundle add vapi-server-sdk
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install vapi-server-sdk
```

## Usage

```ruby
require "vapi-server-sdk"

client = Vapi::Client.new(
  token: 'YOUR_TOKEN'
)
result = client.calls.create()
```

## Async Client 

The SDK exposes an async client that you can use to make non-blocking requests. 

```ruby
require "vapi-server-sdk"

client = Vapi::AsyncClient.new(
  token: 'YOUR_TOKEN'
)
result = client.calls.create()
```


## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly
to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next
generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. 
We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
