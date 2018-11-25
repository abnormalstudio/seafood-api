class FisheryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.fishery_id)
      end
    end
  end

  def update?
    user.admin? || record == user.fishery
  end
end