# frozen_string_literal: true

require 'devise'
# Setting key stretching to 1 to improve the performance in test
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :view
  # Need to find out which include is required
  # config.stretches = Rails.env.test? ? 1 : 10
end
