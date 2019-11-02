# OmniAuth Notejoy OAuth2 Strategy

Strategy to authenticate with Notejoy via OAuth2 in OmniAuth.

For more details, read the Notejoy docs:
https://notejoy.com/help/api

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-notejoy-oauth2'
```

Then `bundle install`.

## Usage

Here's an example for adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :notejoy_oauth2, ENV['NOTEJOY_CLIENT_ID'], ENV['NOTEJOY_CLIENT_SECRET'],
    scope: "read_all"
end
```

You can now access the OmniAuth Notejoy OAuth2 URL: `/auth/notejoy_oauth2`

NOTE: While developing your application, if you change the scope in the
initializer you will need to restart your app server. 

## Auth Hash

Here's an example of an authentication hash available in the callback by
accessing `request.env['omniauth.auth']`:

```ruby
{
  "provider" => "notejoy_oauth2",
  "uid" => "",
  "info" => {
    "name" => "",
    "email" => "",
  },
  "credentials" => {
    "token" => "TOKEN",
    "expires_at" => 1496120719,
    "expires" => false
  },
  "extra" => {
    "raw_info" => {
    }
  }
}
```

## License

Copyright (c) 2019 by Ben Standefer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
