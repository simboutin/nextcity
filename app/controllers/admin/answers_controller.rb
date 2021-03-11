class Admin::AnswersController < ApplicationController

  before_action :set_city
  before_action :set_user

  def create
    @answer = Answer.new(answer_params) # A affiner si plusieurs questions sur la vue admin
    @answer.city_comment = @comment
    @answer.user = current_user

    if @answer.save
      redirect_to admin_user_path(@user), notice: "Réponse ajoutée"
    else
      redirect_to admin_user_path(@user)
    end
    authorize @comment
  end

  private

  def set_user
    @user == current_user
  end

  def answer_params
    params.require(:answer).permit(:content)
  end

end
