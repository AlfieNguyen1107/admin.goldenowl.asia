class CreateProjectHistoryService < ApplicationService
  def initialize(project)
    super()
    @project = project[:project]
    @tools = @project.tools&.map { |tool| tool.name }
    @frameworks = @project.frameworks&.map { |framework| framework.name }
    @skills = @project.skills&.map { |skill| skill.name }
  end

  def call
    create
  end

  private

  def create
    ProjectHistory.transaction do
      @project.developers.each do |developer|
        project_history = ProjectHistory.find_or_initialize_by(company_id: 1,
                                                               developer_id: developer.id,
                                                               name: @project.name)

        project_history.update(
          frameworks: @frameworks,
          from: @project.start_date,
          to: @project.end_date,
          position: developer.position.name,
          details: @project.description,
          skills: @skills.char,
          tools: @tools
        )
      end
    end
  end
end
