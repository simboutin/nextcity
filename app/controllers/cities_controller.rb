class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  #skip_after_action :verify_authorized

  def show
    @city = City.find(params[:id])
    @comments = @city.city_comments.with_answer
    @comment = CityComment.new
    authorize @city
  end

  private

  def article_params
    params.require(:city).permit(:photo)
  end

end
