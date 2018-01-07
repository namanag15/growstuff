# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails', '5.1.4'

gem 'bundler', '>=1.1.5'

gem 'coffee-rails'
gem 'haml'
gem 'sass-rails'

# API data
gem 'jsonapi-resources'

# CSS framework
gem 'bootstrap-sass'
gem 'font-awesome-sass'

gem 'uglifier' # JavaScript compressor

# planting and harvest predictions
gem 'active_median'

gem 'flickraw'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'js-routes' # provides access to Rails routes in Javascript

gem 'cancancan'                    # for checking member privileges
gem 'csv_shaper'                   # CSV export
gem 'figaro'                       # for handling config via ENV variables
gem 'gibbon', '~>1.2.0'            # for Mailchimp newsletter subscriptions

# Maps
gem 'leaflet-rails'
gem 'rails-assets-leaflet.markercluster', source: 'https://rails-assets.org'

gem 'pg'
gem 'ruby-units'                   # for unit conversion
gem 'unicorn'                      # http server

# gem 'comfortable_mexican_sofa'     # content management system

gem 'bootstrap-kaminari-views'     # bootstrap views for kaminari
gem 'kaminari'                     # pagination

gem 'active_utils'
gem 'activemerchant'
gem 'sidekiq'

# Markdown formatting for updates etc
gem 'bluecloth'

# Pagination
gem 'will_paginate'

# user signup/login/etc
gem 'devise'

# nicely formatted URLs
gem 'friendly_id'

# gravatars
gem 'gravatar-ultimate'

# For geolocation
gem 'geocoder'

# For easy calendar selection
gem 'bootstrap-datepicker-rails'

# For connecting to other services (eg Twitter)
gem 'omniauth', '~> 1.3'
gem 'omniauth-facebook'
gem 'omniauth-flickr', '>= 0.0.15'
gem 'omniauth-twitter'

gem "chartkick"

# client for Elasticsearch. Elasticsearch is a flexible
# and powerful, distributed, real-time search and analytics engine.
# An example of the use in the project is fuzzy crop search.

# Project does not use semver, so we want to be in sync with the version of
# elasticsearch we use
# See https://github.com/elastic/elasticsearch-ruby#compatibility
gem "elasticsearch-api"
gem "elasticsearch-model"
gem "elasticsearch-rails"
gem "hashie", ">= 3.5.3"

gem 'rake', '>= 10.0.0'

# locale based flash notices for controllers
gem "responders"

# allows soft delete. Used for members.
gem "paranoia", "~> 2.2"

gem 'xmlrpc' # fixes rake error - can be removed if not needed later

group :production, :staging do
  gem 'bonsai-elasticsearch-rails' # Integration with Bonsa-Elasticsearch on heroku
  gem 'dalli'
  gem 'memcachier'
  gem 'newrelic_rpm'
  gem 'rails_12factor' # supresses heroku plugin injection
  gem 'sparkpost_rails'
end

group :development do
  gem 'better_errors'
  gem 'letter_opener'
  gem 'listen'
  # gem 'binding_of_caller'
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'pry'
  # gem 'quiet_assets'
end

group :development, :test do
  gem "active_merchant-paypal-bogus-gateway"
  gem 'bullet'                          # performance tuning by finding unnecesary queries
  gem 'byebug'                          # debugging
  gem 'capybara'                        # integration tests
  gem 'capybara-email'                  # integration tests for email
  gem 'capybara-screenshot'             # for test debugging
  gem 'coveralls', require: false       # coverage analysis
  gem 'database_cleaner'
  gem 'factory_bot_rails'               # for creating test data
  gem 'faker'
  gem 'haml-i18n-extractor'
  gem 'haml-rails'                      # HTML templating language
  gem 'haml_lint'                       # Checks haml files for goodness
  gem 'i18n-tasks'                      # adds tests for finding missing and unused translations
  gem 'jasmine'                         # javascript unit testing
  gem 'poltergeist'                     # for headless JS testing
  gem 'rainbow', '< 2.2.0' # See https://github.com/sickill/rainbow/issues/44
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails' # unit testing framework
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'webrat' # provides HTML matchers for view tests
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'rails-controller-testing'
  gem 'timecop'
end

group :travis do
  gem 'platform-api'
end
