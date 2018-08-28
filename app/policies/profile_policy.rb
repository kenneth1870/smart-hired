class ProfilePolicy < ApplicationPolicy
  def update?
    user.candidate?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
