class CareerService < ApplicationService
  def initialize(params)
    super()
    @search = params[:search] if params[:search].present?
  end

  def call
    @search.present? ? Career.search(@search) : Career.all.order(id: :asc)
  end
end
