class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user  # Only user creator can update it
  end

end
