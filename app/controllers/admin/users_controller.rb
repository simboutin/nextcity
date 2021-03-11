class Admin::UsersController < ApplicationController
  def show
    @city = City.find(2)#A dynamiser quand on aura ajouté le city_id aux users
    @comments = @city.city_comments
    @answer = Answer.new
  end
end
