class CatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(fishery_id: user.fishery_id)
      end
    end
  end

  def update?
    user.admin? || record.fishery == user.fishery
  end
end