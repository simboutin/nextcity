class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.includes(:city)
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
