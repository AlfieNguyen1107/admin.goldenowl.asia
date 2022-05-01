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

  def nested_groups(groups)
    content_tag(:ul) do
       groups.map do |group, sub_groups|
          content_tag(:li, group.name +  nested_groups(sub_groups))
       end.join.html_safe
    end  
 end

 def nested_attributes(attributes)
  content_tag :ul do
      attributes.each do |attribute|
          concat(content_tag(:li, attribute.name))
          if attribute.has_children? 
              concat(nested_attributes(attribute.children))
          end
      end
  end
end
end
