class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @homepage = true
    @disable_container = true
    @disable_margins = true
  end
end
