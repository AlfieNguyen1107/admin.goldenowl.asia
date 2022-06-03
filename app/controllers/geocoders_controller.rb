class GeocodersController < ApplicationController
  def search_address
    @address = Geocoder.search(params[:address])
    render json: @address
  end
end
