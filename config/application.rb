require_relative 'boot'

require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProyectoWeb
  class Application < Rails::Application

  end
end
