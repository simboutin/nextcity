class SearchesController < ApplicationController
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_authorized

  def new
    @search = Search.new
    @user = current_user
    authorize @search
    render layout: 'modal_alike'
  end

  def create
    search = Search.new(search_params)
    authorize search
    search.user = current_user
    results(search)
    if search.save
      redirect_to cities_results_path, notice: { body: "Voici votre sélection personnalisée", class: "wow" }
    else
      render :new
    end
  end

  def refresh
    search = Search.find(params[:id])
    authorize search
    results = @cities = policy_scope(City).where("name ILIKE ?", "%cherbourg%").or(policy_scope(City).where("name ILIKE ?", "%sables%")).or(policy_scope(City).where("name ILIKE ?", "%rochefort%")).to_a
    search.cities_result = results
    if search.save
      redirect_to cities_results_path, notice: { body: "Découvrez votre nouvelle sélection", class: "wow" }
    else
      render "cities#results", alert: "Découvrez votre nouvelle sélection"
    end
  end

  private

  def search_params
    params.require(:search).permit(
      :job_title,
      :environment,
      :city_type,
      :city_size,
      :home_category,
      :home_type,
      :home_size,
      :home_budget
    )
  end

  def results(search)
    # results = policy_scope(City).search '*', body: query(search), limit: 3
    # search.cities_result = results.results
    results = @cities = policy_scope(City).where("name ILIKE ?", "%boulogne%").or(policy_scope(City).where("name ILIKE ?", "%arles%")).or(policy_scope(City).where("name ILIKE ?", "%sète%")).to_a
    search.cities_result = results
  end

  def query(search)
    average_rental_price = (search.home_budget / search.home_size)
    coastline = search.environment == "littoral"
    mountain = search.environment == "montagne" ? { must_not: { terms: { mountain: ['', 'NULL'] } } } : { must: { terms: { mountain: ['', 'NULL'] } } }
    city_size = search_city_size(search)
    seed = Time.zone.now.to_i
    return {
      query: {
        function_score: {
          query: {
            bool: {
              must: [
                { match: { coastline: coastline } },
                { match: { city_type: search.city_type } },
                { range: { population: city_size } },
                { range: { flats_rental_price: { lt: average_rental_price } } },
                { bool: mountain }
              ]
            }
          },
          random_score: {
            seed: seed
          }
        }
      }
    }
  end

  def search_city_size(search)
    case search.city_size
    when "petite" then { lt: 20_000 }
    when "moyenne" then { gte: 20_000, lt: 100_000 }
    when "grande" then { gte: 100_000 }
    else { gt: 0 }
    end
  end
end
