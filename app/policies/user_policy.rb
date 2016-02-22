class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    record.user == user || user.admin? # Only user creator can update it
  end

  def destroy?
    record.user == user || user.admin? # Only user creator can destroy it
  end

end
