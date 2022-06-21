class AnnualLeavePolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
