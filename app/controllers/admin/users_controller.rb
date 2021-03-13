class Admin::UsersController < ApplicationController
  before_action :set_user

  def show
    #A dynamiser quand on aura ajouté le city_id aux users
    @city = City.find(2)
    @comments = @city.city_comments
    @answer = Answer.new
    @disable_container = true
    @disable_margins = true
  end

  private

  def set_user
    @user = current_user
  end
end
