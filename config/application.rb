require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ApplicationPost
  class Application < Rails::Application
    config.load_defaults 6.0

    config.time_zone = 'Africa/Abidjan'
    config.active_record.default_timezone = :local

    config.generators do |g|
      # La description dans ces deux lignes crée un paramètre qui n'est pas généré automatiquement.
      g.assets false
      g.helper false
    end

  end
  
end
