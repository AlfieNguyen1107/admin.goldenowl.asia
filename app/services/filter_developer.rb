class FilterDeveloper
  def initialize(developers, days, tech_ids)
    @developers = developers
    @days = days
    @tech_ids = tech_ids
  end

  def developer_filter
    @developers_free = @developers.not_have_current_project
    @developers_free = @developers_free.with_teches(@tech_ids) if @tech_ids.present?

    @developers = @developers.with_teches(@tech_ids) if @tech_ids.present?
    @developers = @developers.free_after_x_days(@days) if @days != 0
    @developers = @developers.or(@developers_free)
    @developers = @developers.order(id: :asc)
  end
end
