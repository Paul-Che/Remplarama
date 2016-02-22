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
    record.user == user  # Only slot creator can update it
  end

  def destroy?
    record.user == user  # Only slot creator can update it
  end

end

