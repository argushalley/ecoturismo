Ecoturismo::Application.config.tap do |config|
  config.encoding = "utf-8"
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  config.time_zone = 'Brasilia'
  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  I18n.enforce_available_locales = false # https://github.com/rails/rails/issues/13159
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]
  config.i18n.available_locales = [:'pt-BR', :en]
  config.i18n.default_locale = :'pt-BR'
  # Fix for ActiveAdmin i18n madness
  # https://github.com/gregbell/active_admin/issues/434
  #I18n.locale = config.i18n.locale = config.i18n.default_locale
end
