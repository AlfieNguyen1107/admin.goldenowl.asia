class ItemHistoryPolicy < ApplicationPolicy
  def update?
    @record.in_progress?
  end
end
