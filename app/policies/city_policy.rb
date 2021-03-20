class CityPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def show?
    true
  end

  def results?
    user.searches.present?
  end
end
