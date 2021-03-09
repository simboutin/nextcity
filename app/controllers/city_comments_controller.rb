class CityCommentsController < ApplicationController
  before_action :set_city
  before_action :set_user

  def create
    @comment = @city.city_comments.new(city_comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @city, notice: "Commentaire ajouté"
    else
      redirect_to @city
    end
    authorize @comment
  end

  private

  def set_user
    @user == current_user
  end

  def set_city
    @city = City.find(params[:city_id])
  end

  def city_comment_params
    params.require(:city_comment).permit(:content)
  end

end
