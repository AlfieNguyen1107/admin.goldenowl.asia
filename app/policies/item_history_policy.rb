class ItemHistoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @record.hold?
  end

  def edit?
    true
  end

  def destroy?
    true
  end
end
