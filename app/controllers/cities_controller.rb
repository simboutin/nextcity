class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :results ]
  # skip_after_action :verify_authorized

  def show
    @city = City.find(params[:id])
    @comments = @city.city_comments
    @comment = CityComment.new
    authorize @city
  end

  def results
    # City.reindex
    @search = current_user.searches.last
    @cities = City.search(where: query, limit: 3)
    @disable_container = true
    @disable_margins = true
    authorize @cities
  end

  private

  def query
    @average_rental_price = (@search.home_budget / @search.home_size)
    @coastline = @search.environment == "littoral"
    @mountain = @search.environment == "montagne" ? { not: [nil, ''] } : [nil, '']
    {
      coastline: @coastline,
      mountain: @mountain,
      city_type: @search.city_type,
      flats_rental_price: { lt: @average_rental_price }
    }
  end
end
