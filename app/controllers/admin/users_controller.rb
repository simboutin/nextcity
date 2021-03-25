class Admin::UsersController < ApplicationController
  before_action :set_user
  before_action :check, only: :tasks

  def show
    @city = @user.city || City.last #rendre dynamique avec l'attributation de l'user ID pour le user (pour le moement seul l'embassador à un cityID)
    @comments = @city.city_comments
    @answer = Answer.new
    @disable_container = true
    @disable_margins = true
    @bookmarks = @user.bookmarks
  end

  def tasks
    @search = @user.searches.last
    @city = @user.city
    @disable_container = true
    @disable_margins = true
  end

  def update_city
    @city = City.find(params[:city_id])
    @user.city = @city
    if @user.save
      redirect_to admin_tasks_path, notice: { body: "3..2..1... Décollage immédiat pour #{@city.name}", class: "rocket" }
    else
      render "cities#show"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def check
    return redirect_to root_path, notice: "Vous devez d'abord sélectionner votre ville de destination." if current_user.city.nil?
  end
end
