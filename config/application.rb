# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdminGoldenowlAsia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    Rails.configuration.to_prepare do
      # magic code
      # don't remove this one
      ActiveStorage::Attachment.class_eval do
        def resize(size)
          variant(
            resize_to_limit: record.respond_to?(:image_config) ? record.image_config[size] : nil
          )
        end
      end
    end

    config.paperclip_defaults = if Rails.env.test? || Rails.env.development?
                                  {
                                    storage: :fog,
                                    fog_credentials: {
                                      provider: 'Local',
                                      default_url: '/images/:style/missing.png',
                                      local_root: "#{Rails.root}/public"
                                    },
                                    fog_directory: '',
                                    fog_host: ''
                                  }
                                else
                                  {
                                    storage: :cloudinary,
                                    path: ':class/:attachment/:id/:style/:filename'
                                  }
                                end
    config.active_job.queue_adapter = :sidekiq
  end
end
