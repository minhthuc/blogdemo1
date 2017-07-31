require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)
require "carrierwave"
require "carrierwave/orm/activerecord"

module BL
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end
