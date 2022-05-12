# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  def alert_class_of_flash(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.fetch(flash_type.to_sym, 'alert-info')
  end

  def active_items(item)
    'active' if controller_name == item
  end

  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        name = link_to attribute.name, position_path(attribute.id)
        concat(content_tag(:li, name.html_safe))
        concat(nested_attributes(attribute.children)) if attribute.has_children?
      end
    end
  end
end
