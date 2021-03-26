class Admin::UsersController < ApplicationController
  before_action :set_user
  before_action :check, only: :tasks

  def show
    if @user.city
      @city = @user.city
      @comments = @city.city_comments
    end
    @answer = Answer.new
    @disable_container = true
    @disable_margins = true
    @bookmarks = @user.bookmarks.includes(:city).order('cities.name')
  end

  def tasks
    @search = @user.searches.last
    @city = @user.city
    @disable_container = true
    @disable_margins = true
  end

  def update_city
    @city = City.friendly.find(params[:city_id])
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
    return redirect_to root_path, notice: "Vous n'êtes pas autorisé à accéder à cette page." if current_user.city.nil? || current_user.ambassador
  end
end
