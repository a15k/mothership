require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mothership
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # config.api_only = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.assets.enabled = false

    # Don't spin up the app just to precomplie; avoiding that lets us
    # not have a configured database when building an image
    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.assets false
    end

  end

end
