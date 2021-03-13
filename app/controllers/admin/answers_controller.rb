class Admin::AnswersController < ApplicationController
  before_action :set_user

  def create
    @answer = Answer.new(answer_params) # A affiner si plusieurs questions sur la vue admin
    @city = @user.city
    @answer.city_comment_id = params[:city_comment_id]
    @answer.user = current_user

    if @answer.save
      redirect_to admin_user_path(@user), notice: "Réponse ajoutée"
    else
      redirect_to admin_user_path(@user), notice: "Réponse ratée"
    end
    authorize @answer
  end

  private

  def set_user
    @user = current_user
  end

  def answer_params
    params.require(:answer).permit(:comment)
  end

end
