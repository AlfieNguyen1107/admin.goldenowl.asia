class AnnualLeavesController < ApplicationController
  before_action :set_annual_leaves_collection, only: %i[index]

  def index
    @pagy, @annual_leaves = pagy(@annual_leaves, items: per_page)
  end

  private

  def set_annual_leaves_collection
    @annual_leaves = AnnualLeave.order(id: :asc)
    authorize(@annual_leaves)
  end
end
