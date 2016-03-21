class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.booking.user == user || record.booking.slot.user == user
  end

  private

  def user_is_owner_or_admin
    record.user == user || user.admin?
  end
end
