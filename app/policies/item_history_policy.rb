class ItemHistoryPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    @record.hold?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
