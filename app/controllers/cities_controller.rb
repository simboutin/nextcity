class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :results ]
  # skip_after_action :verify_authorized

  def show
    @city = City.find(params[:id])
    @comments = @city.city_comments
    @comment = CityComment.new
    authorize @city

    @markers = [{
            lat: @city.latitude,
            lng: @city.longitude
              }]

    @mega_banner = true
  end

  def results
    @disable_container = true
    @disable_margins = true
    @cities = policy_scope(City).limit(3)
    authorize @cities
  end

  private

  def article_params
    params.require(:city).permit(:photo)
  end

end
