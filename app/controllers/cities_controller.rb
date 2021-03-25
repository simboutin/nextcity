class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :check, only: :results
  # skip_after_action :verify_authorized, only: :results

  def show
    @city = City.friendly.find(params[:id])
    @comments = @city.city_comments
    @comment = CityComment.new
    if user_signed_in?
      @search = current_user.searches.last
      @has_current_bookmark = current_user.bookmark_for(@city).present?
      if @has_current_bookmark
        @bookmark = current_user.bookmark_for(@city)
      else
        @bookmark = Bookmark.new
      end
    end
    authorize @city

    @markers = [{ lat: @city.latitude, lng: @city.longitude }]
    # @city_coordinates = JSON.parse(@city.geo_shape)["coordinates"]
    @city_coordinates = @city.geo_shape
    @disable_container = true
  end

  def results
    # City.reindex
    @search = current_user.searches.last
    @cities = @search.cities_result
    @cities.map { |city| authorize city }
    @disable_container = true
    @disable_margins = true
  end

  def check
    return redirect_to root_path, notice: "Vous devez d'abord faire une recherche en cliquant sur 'Inspirez-moi'" if current_user.searches.empty?
  end
end
