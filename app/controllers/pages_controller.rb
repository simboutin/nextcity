class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :components, :form ]

  def home
    @homepage = true
    @disable_container = true
    @disable_margins = true
    # @cities = policy_scope(City).order(Arel.sql('RANDOM()')).limit(3)
    @cities = policy_scope(City).where("name ILIKE ?", "%eclose%").or(policy_scope(City).where("name ILIKE ?", "%lyon%")).or(policy_scope(City).where("name ILIKE ?", "%marcy%"))
  end

  def components
  end
end
