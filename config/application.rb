require "active_record/railtie"
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Zips
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    # Bootstraps mongoid within application -- like rails console
    Mongoid.load!('./config/mongoid.yml')

    # Specify which default ORM are we using with scaffold
    # add --orm none, mongoid, or active_record
    # to rails generate cmd line to be specific
    config.generators {|g| g.orm:active_record}

    # Do not swallow errors in after_commit/after_rollback callbacks
    #config.active_record.raise_in_transactional_callbacks = true
    
  end
end
