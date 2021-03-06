class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]


  def show

    @city = City.find(params[:id])
    authorize @city
  end

  private

  def article_params
  params.require(:city).permit(:photo)
  end

end
