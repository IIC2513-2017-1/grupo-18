require_relative 'boot'

require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProyectoWeb
  class Application < Rails::Application
  	# mail: mailer.grupo.18.web@gmail.com
  	# password: web1web2

    config.action_mailer.smtp_settings = {
      :user_name => "farojos",
      :password => "web1web2",
      :domain => 'http://proyecto-web-g18.herokuapp.com/login',
      :address => 'smtp.sendgrid.net',
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  end
end
