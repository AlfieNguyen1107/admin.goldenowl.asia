# Override Wicked PDF
# Fix issues related loading javacript, css, images compiled by webpack 5+

class WickedPdf
  module WickedPdfHelper
    module Assets
      def wicked_pdf_stylesheet_pack_tag(*sources)
        return unless defined?(Webpacker)

        if running_in_development?
          stylesheet_pack_tag(*sources, host: wicked_pdf_pack_host)
        else
          css_text = sources.collect do |source|
            source = WickedPdf::WickedPdfHelper.add_extension(source, 'css')
            wicked_pdf_stylesheet_link_tag(webpacker_source_url(source))
          end.join("\n")
          css_text.respond_to?(:html_safe) ? css_text.html_safe : css_text
        end
      end

      def wicked_pdf_javascript_pack_tag(*sources)
        return unless defined?(Webpacker)

        if running_in_development?
          javascript_pack_tag(*sources, host: wicked_pdf_pack_host)
        else
          sources.collect do |source|
            source = WickedPdf::WickedPdfHelper.add_extension(source, 'js')
            "<script type='text/javascript'>#{read_asset(webpacker_source_url(source))}</script>"
          end.join("\n").html_safe
        end
      end

      def wicked_pdf_image_pack_tag(img, options = {})
        image_tag(wicked_pdf_asset_pack_path(img), options)
      end

      def wicked_pdf_asset_pack_path(asset)
        return unless defined?(Webpacker)

        if running_in_development?
          asset_pack_path(asset, host: wicked_pdf_pack_host)
        else
          wicked_pdf_asset_path(webpacker_source_url(asset))
        end
      end

      private

      def webpacker_source_url(source)
        return unless defined?(Webpacker) && defined?(Webpacker::VERSION)

        if Webpacker::VERSION >= '3.2.0'
          asset_pack_url(source, host: wicked_pdf_pack_host)
        else
          source_path = asset_pack_path(source)
          root_url[0...-1] + source_path
        end
      end

      def wicked_pdf_pack_host
        Rails.application.config.asset_host || root_url[0...-1]
      end
    end
  end
end
