class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def show?
  #   true  # Anyone can view a slot
  # end

  def create?
    true  # Anyone can create a slot
  end

  def update?
    record.user == user || user.admin? # Only slot creator or admin can update it
  end

  def destroy?
    record.user == user || user.admin? # Only slot creator or admin can update it
  end

end

