class GeocodersController < ApplicationController
  def show_address
    @address = Geocoder.search(params[:position])
    render json: { html: @address }
  end

  def handler_address
    @address = Geocoder.search(params[:address])
    render json: { html: @address }
  end
end
