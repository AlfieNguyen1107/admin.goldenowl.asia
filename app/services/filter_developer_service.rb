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

  def fetch_developers_free
    return unless tech_ids.present?

    developers.not_have_current_project.with_teches(tech_ids)
  end

  def developer_filter
    return unless developers.present?

    developer_filter = developers.with_teches(tech_ids) if tech_ids.present?
    unless days.zero?
      developer_filter = developer_filter.free_after_x_days(days)
    end
    developer_filter.or(fetch_developers_free).order(id: :asc)
  end

  def developers
    @developers ||= Developer.all.joins(:projects, :teches)
  end
end
