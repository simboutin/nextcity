class CityCommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def ask_question?
    user && user.ambassador == false
  end
end
