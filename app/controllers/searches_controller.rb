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
    @search = Search.new(search_params)
    authorize @search
    @search.user = current_user
    if @search.save
      redirect_to cities_results_path, notice: "Voici votre sélection personnalisée"
    else
      render :new
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
end
