class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :components ]

  def home
    @homepage = true
    @disable_container = true
    @disable_margins = true
    @cities = policy_scope(City).order(Arel.sql('RANDOM()')).limit(3)
  end

  def components
  end
end
