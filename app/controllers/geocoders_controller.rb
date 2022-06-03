class GeocodersController < ApplicationController
  def display_name_address
    @address = Geocoder.search(params[:position])
    render json: @address
  end

  def show_location_address
    @address = Geocoder.search(params[:address])
    render json: @address
  end
end
