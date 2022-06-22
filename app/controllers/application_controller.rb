# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout :layout_by_resource

  DEFAULT_PER_PAGE = 50
  MAX_PER_PAGE = 100

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def per_page
    return DEFAULT_PER_PAGE if params[:size].blank?

    params[:size].to_i > MAX_PER_PAGE ? MAX_PER_PAGE : params[:size]
  end

  def user_not_authorized
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
