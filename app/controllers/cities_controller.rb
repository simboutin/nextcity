class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  #skip_after_action :verify_authorized

  def show
    @city = City.find(params[:id])
    @comments = @city.city_comments
    @comment = CityComment.new
    authorize @city

  @markers = [{
            lat: @city.latitude,
            lng: @city.longitude
              }]
  end

  private

  def article_params
  params.require(:city).permit(:photo)
  end

end
