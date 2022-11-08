![GitHub action results](https://github.com/G-Bro/teemill-ruby-sdk/actions/workflows/ruby.yml/badge.svg)
![GitHub lint results](https://github.com/G-Bro/teemill-ruby-sdk/actions/workflows/lint.yml/badge.svg)
![CodeFactor](https://www.codefactor.io/repository/github/g-bro/teemill-ruby-sdk/badge)
![Gem version](https://img.shields.io/gem/v/gbro_teemill)
![Download count](https://img.shields.io/gem/dv/gbro_teemill/stable)

# Ruby SDK for the Teemill API

## Installation

To install with Bundler, add this to your Gemfile

```bash
gem 'gbro_teemill'
```
and then run `bundle install`

or install globally with
```bash
gem install gbro_teemill
```

## Usage

As an example, here is how you can create a custom product
```ruby
require 'gbro_teemill'

# authenticate using bearer token method
Teemill.legacy_api_key = '...'

# create a custom product
custom_product = Teemill::CustomProduct.create({image_url: '...' })
```

### Authentication

For most requests, all you need to provide is an API key

```ruby
Teemill.api_key = '<your api key>'
```

For some legacy requests you must instead provide a legacy API key

```ruby
Teemill.legacy_api_key = '<your bearer token api key>'
```

### Custom Products

```ruby
custom_product = Teemill::CustomProduct.create({
    image_url: 'https://domain.com/path/to/image.png'
})
```
