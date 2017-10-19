require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OtpTestHarnessBackend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # Set default CORS settings
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # /http:\/\/localhost:(\d*)/
        resource '*',
          # headers: ['Origin', 'X-Requested-With', 'Content-Type', 'Accept',
          #   'Authorization', 'X-User-Token', 'X-User-Email',
          #   'Access-Control-Request-Headers', 'Access-Control-Request-Method'
          # ],
          headers: :any, # fixes CORS errors on OPTIONS requests
          methods: [:get, :post, :put, :delete, :options]
        end
    end

  end
end
