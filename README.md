# OmniAuth Office365

[![Gem Version](http://img.shields.io/gem/v/omniauth-office365.svg)][gem]
[![Build Status](http://img.shields.io/travis/jcarbo/omniauth-office365.svg)][travis]
[![Code Climate](http://img.shields.io/codeclimate/github/jcarbo/omniauth-office365.svg)][codeclimate]

[gem]: https://rubygems.org/gems/omniauth-office365
[travis]: http://travis-ci.org/jcarbo/omniauth-office365
[codeclimate]: https://codeclimate.com/github/jcarbo/omniauth-office365

Gem to authenticate applications to the Office365 v2.0 REST API via OAuth2.

**Note** An unmaintained (at least as of this writing) omniauth-office365 gem exists at https://github.com/simi/omniauth-office365. However, it's built on an older, deprecated version of the API.

# Setup
* Full documentation at https://msdn.microsoft.com/office/office365/api/use-outlook-rest-api.
* Developer Console: https://apps.dev.microsoft.com/
* Available Scopes: https://msdn.microsoft.com/office/office365/howto/authenticate-office-365-apis-using-v2#bk_Outlookscopes.

**Note** Depending on the which scopes you choose, a successful response may not contain an access_token. In that cases, an error will be raised in the `oauth2` gem. There's a PR that should address this: https://github.com/intridea/oauth2/pull/243.

## Standard setup:

```ruby
  # Add to your initializers/omniauth.rb

  use OmniAuth::Builder do
    provider :office365, ENV['OFFICE365_APP_ID'], ENV['OFFICE365_APP_SECRET'], :scope => 'https://outlook.office.com/mail.read'
  end
```

## Setup with Devise:

```ruby
  # Add to your devise.rb

  config.omniauth :office365, ENV['OFFICE365_APP_ID'], ENV['OFFICE365_APP_SECRET'], :scope => 'https://outlook.office.com/mail.read'
```
