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
    @record.in_progress?
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
