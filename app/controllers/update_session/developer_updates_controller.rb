# frozen_string_literal: true

module UpdateSession
  class DeveloperUpdatesController < ApplicationController
    before_action :set_developer, only: %i[update_session_project update_session_programming_language update_session_framework update_session_university]
    before_action :set_employee, only: %i[update_session_tool update_session_skill update_session_education]

    def update_session_project
      developer_projects = @developer.update(set_params_update_session_project)
      redirect_to developer_path(@developer)
    end

    def update_session_programming_language
      developer_programming_language = @developer.update(set_params_update_session_programming_language)
      redirect_to developer_path(@developer)
    end

    def update_session_framework
      developer_framework = @developer.update(set_params_update_session_framework)
      redirect_to developer_path(@developer)
    end

    def update_session_tool
      employee_tool = @employee.update(set_params_update_session_tool)
      redirect_to developer_path(@developer)
    end

    def update_session_skill
      employee_skill = @employee.update(set_params_update_session_skill)
      redirect_to developer_path(@developer)
    end

    def update_session_education
      employee_university = @employee.update(set_params_update_session_university)
      redirect_to developer_path(@developer)
    end

    def set_developer
      @developer = Developer.find(params[:id])
    end

    def set_employee
      set_developer
      @employee = @developer.employable
    end

    private

    def set_params_update_session_university
      params.require(:employee).permit(education_histories_attributes: %i[id university_id details from to subject _destroy])
    end

    def set_params_update_session_skill
      params.require(:employee).permit(employee_skills_attributes: %i[id skill_id level _destroy])
    end

    def set_params_update_session_tool
      params.require(:employee).permit(employee_tools_attributes: %i[id tool_id level _destroy])
    end

    def set_params_update_session_framework
      params.require(:developer).permit(developer_frameworks_attributes: %i[id framework_id level _destroy])
    end

    def set_params_update_session_project
      params.require(:developer).permit(developer_projects_attributes: %i[id project_id _destroy])
    end

    def set_params_update_session_programming_language
      params.require(:developer).permit(developer_programming_languages_attributes: %i[id programming_language_id level _destroy])
    end

    # before_action :set_employee, only: %i[
    #   developer_tool
    #   developer_tool_delete
    #   developer_skill
    #   developer_skill_delete
    # ]

    # def developer_project
    #   developer_project = DeveloperProject.new(developer_id: params[:id], project_id: params[:developer][:project_ids])
    #   redirect_to developer_path(params[:id]) if developer_project.save
    # end

    # def developer_project_delete
    #   developer_project = DeveloperProject.where(developer_id: params[:id], project_id: params[:project_id])
    #   redirect_to developer_path(params[:id]) if developer_project.first.destroy
    # end

    # def developer_programming_language
    #   developer_programming_language = DeveloperProgrammingLanguage.new(
    #     developer_id: params[:id],
    #     programming_language_id: params[:developer][:programming_language_ids],
    #     level: params[:developer][:level]
    #   )
    #   redirect_to developer_path(params[:id]) if developer_programming_language.save
    # end

    # def developer_programming_language_delete
    #   developer_programming_language = DeveloperProgrammingLanguage.where(developer_id: params[:id], programming_language_id: params[:programming_language_id])
    #   redirect_to developer_path(params[:id]) if developer_programming_language.first.destroy
    # end

    # def developer_framework
    #   developer_framework = DeveloperFramework.new(
    #     developer_id: params[:id],
    #     framework_id: params[:developer][:framework_ids],
    #     level: params[:developer][:level]
    #   )
    #   redirect_to developer_path(params[:id]) if developer_framework.save
    # end

    # def developer_framework_delete
    #   developer_framework = DeveloperFramework.where(developer_id: params[:id], framework_id: params[:framework_id])
    #   redirect_to developer_path(params[:id]) if developer_framework.first.destroy
    # end

    # def developer_tool
    #   developer_tool = EmployeeTool.new(
    #     employee_id: @employee.id,
    #     tool_id: params[:developer][:tool_id],
    #     level: params[:developer][:level]
    #   )
    #   redirect_to developer_path(params[:id]) if developer_tool.save
    # end

    # def developer_tool_delete
    #   developer_tool = EmployeeTool.where(employee_id: @employee.id, tool_id: params[:tool_id])
    #   redirect_to developer_path(params[:id]) if developer_tool.first.destroy
    # end

    # def developer_skill
    #   developer_skill = EmployeeSkill.new(
    #     employee_id: @employee.id,
    #     skill_id: params[:developer][:skill_id],
    #     level: params[:developer][:level]
    #   )
    #   redirect_to developer_path(params[:id]) if developer_skill.save
    # end

    # def developer_skill_delete
    #   developer_skill = EmployeeSkill.where(employee_id: @employee.id, skill_id: params[:skill_id])
    #   redirect_to developer_path(params[:id]) if developer_skill.first.destroy
    # end

    # def set_employee
    #   @employee = Developer.find(params[:id]).employable
    # end
  end
end
