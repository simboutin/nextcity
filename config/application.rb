require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nextcity
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.to_prepare do
      Devise::SessionsController.layout "modal_alike"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "modal_alike" }
      Devise::ConfirmationsController.layout "modal_alike"
      Devise::UnlocksController.layout "modal_alike"            
      Devise::PasswordsController.layout "modal_alike"        
    end
  end
end
