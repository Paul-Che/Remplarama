class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true  # Anyone can view a page
  end

end
