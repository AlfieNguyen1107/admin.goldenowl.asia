# frozen_string_literal: true

module ResizeImage
  extend ActiveSupport::Concern

  module ClassMethods
    def resize_image_config(opts)
      define_method :image_config do
        opts
      end
    end
  end
end
