class Admin::UsersController < ApplicationController
  before_action :set_user

  def show
    @city = @user.city || City.last #rendre dynamique avec l'attributation de l'user ID pour le user (pour le moement seul l'embassador à un cityID)
    @comments = @city.city_comments
    @answer = Answer.new
    @disable_container = true
    @disable_margins = true
    @bookmarks = @user.bookmarks
  end

  private

  def set_user
    @user = current_user
  end
end
