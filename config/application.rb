require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kadegaje
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Railsアプリのロケール設定を日本語に変更
    config.i18n.default_locale = :ja
    # config/locales フォルダ内のすべての .yml ファイルを翻訳ファイルとして読み込ませる
    config.i18n.load_path+=Dir[Rails.root.join('config','locales','**','*.yml').to_s]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # 日本時間へ変更
    config.time_zone = "Asia/Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
