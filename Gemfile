# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for ORM ActiveRecord
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Add rspecs as rails testing suite
  gem 'rspec-rails', '~> 3.7'
  # Fake data generator
  gem 'faker', '~> 1.8.7'
  # Factory models generator
  gem 'factory_bot_rails', '~> 4.10.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Add better errors to improve the rails error page
  gem 'better_errors', '~> 2.4.0'
  gem 'binding_of_caller', '~> 0.8.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Authentication, roles and permissions
gem 'cancancan', '~> 1.17.0'
gem 'devise', '~> 4.4.3'
gem 'omniauth-marvin', '~> 1.0.2'

# File upload in the background
gem 'carrierwave', '~> 1.2'
gem 'carrierwave_backgrounder', git: 'https://github.com/lardawge/carrierwave_backgrounder.git'

# Routing
gem 'friendly_id', '~> 5.2.4'

# Default RESTful actions in the controllers
# WARNING! Support dropped in CanCanCan >2.0
gem 'inherited_resources', ' ~> 1.8.0'

# Scope-based pagination
gem 'kaminari', '~> 1.1.1'

# WARNING! Overrides ActiveRecord delete and destroy!
# Discards record instead of deleting it.
gem 'paranoia', '~> 2.4.1'

# Calling github to get the latest updates
# Wrapper around the ActiveRecord model, to provide search form method helpers
gem 'ransack', github: 'activerecord-hackery/ransack'

# Redis: in-memory database
gem 'redis', '~> 4.0.1'

# Background process runner for Ruby
gem 'sidekiq', '~> 5.1.3'

# HTML and CSS gems
gem 'haml-rails', '~> 1.0.0'
gem 'twitter-bootstrap-rails', '~> 4.0.0'

# Form wrapper component
gem 'simple_form', '~> 4.0.1'

# Wrapper for reading metadata and transcoding movies
gem 'streamio-ffmpeg', '~> 3.0.2'

# Include jQuery for Bootstrap
gem 'jquery-rails'
