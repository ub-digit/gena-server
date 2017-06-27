class V1::PlacesController < ApplicationController
  def index
    places = Place.all.order('id ASC')
    render json: {places: places.as_json}, status: 200
  end
end
