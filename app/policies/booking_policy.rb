class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def confirm?
    user.id == record.slots.first.user_id
  end

  def reject?
    user.id == record.slots.first.user_id
  end

  def update?
    user_is_owner_or_admin
  end

  def destroy?
    user_is_owner_or_admin
  end

  private

  def user_is_owner_or_admin
    record.user == user || user.admin?
  end
end
