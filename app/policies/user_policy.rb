class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def search_practices?
    true
  end

  def search_locums?
    true
  end

  def show?
    true
  end

  def update?
    @record == @user || @user.admin? # Only user creator can update it
  end

  def destroy?
    record.user == @user || @user.admin? # Only user creator can destroy it
  end

  def verify?
    record.user == @user || @user.admin? # Only current uer can verify its identity
  end

end
