# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'awesome_print'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Matcha
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Load the services files
    config.autoload_paths += %W[
      #{config.root}/app/services
    ]
    config.eager_load_paths += %W[
      #{config.root}/app/services
    ]

    # Make ActiveJob use SideKiq
    config.active_job.queue_adapter = :sidekiq
  end
end
