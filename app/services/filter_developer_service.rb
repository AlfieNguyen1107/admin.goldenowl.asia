class FilterDeveloperService < ApplicationService
  def initialize(params)
    @params = params
    @days = params[:day].to_d
    @tech_ids = params.dig(:filter, :tech_ids)
  end

  def call
    data = developer_filter

    ServiceResponse.new(payload: data)
  end

  private

  attr_reader :params, :days, :tech_ids

  def developer_filter
    developers = Developer.all

    return developers if developers.blank?

    developers = developers.joins(:projects, :teches)
    developers_free = developers.not_have_current_project
    developers_free = developers_free.with_teches(tech_ids) if tech_ids.present?

    developers = developers.with_teches(tech_ids) if tech_ids.present?
    developers = developers.free_after_x_days(days) unless days.zero?
    developers.or(developers_free).order(id: :asc)
  end
end
