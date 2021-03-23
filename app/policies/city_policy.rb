class CityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.with_attached_photos
    end
  end

  def show?
    true
  end

  def results?
    user.searches.present?
  end
end
