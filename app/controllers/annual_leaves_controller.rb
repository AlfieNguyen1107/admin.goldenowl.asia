class AnnualLeavesController < ApplicationController
  def index
    @pagy, @annual_leaves = pagy(AnnualLeave.order(id: :asc), items: per_page)
  end
end
