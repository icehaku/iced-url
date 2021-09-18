# iced-url

[![Build Status](https://app.travis-ci.com/icehaku/iced-url.svg?branch=main)](https://app.travis-ci.com/icehaku/iced-url)

[![Maintainability](https://api.codeclimate.com/v1/badges/95f9e995aa45f54120c2/maintainability)](https://codeclimate.com/github/icehaku/iced-url/maintainability)

* Ruby version: 3.0.2p107
* Rails version: Rails 6.1.4.1

## Description
A small code challenge;

Build a TinyURL clone in Ruby on Rails.
It should allow users to submit a URL which will then be shortened and can be shared.
When users click on the short URL they are redirected to the long URL.
Track the IP address of each visit to a URL

## Run the Project

```console
git clone git@github.com:icehaku/iced-url.git
bundle install
rake db:prepare
rspec ./spec #test suite
```

# APP Routes
* Creates a short URL.
> /

* Navigate/Redirect using the short URL.
> /(:short_url)

* Check stats showing click counts and remote_ips.
> /(:short_url)/stats

# Hosted Project on Heroku

https://iced-url.herokuapp.com/
