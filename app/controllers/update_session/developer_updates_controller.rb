# frozen_string_literal: true

module UpdateSession
  class DeveloperUpdatesController < ApplicationController
    before_action :set_developer, only: %i[update_session_with_developer]
    before_action :set_employee, only: %i[update_session_with_employee]

    def update_session_with_employee
      if params[:employee].present? && @employee.update(set_params_update_session_employees)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_with_developer
      if params[:developer].present? && @developer.update(set_params_update_session_developers)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def set_employee
      set_developer
      @employee = @developer.employable
    end

    private

    def set_developer
      @developer = Developer.find(params[:id])
    end

    def set_params_update_session_employees
      params.require(:employee).permit(
        employee_tools_attributes: %i[id tool_id level _destroy],
        certificate_employees_attributes: %i[id certificate_id year score _destroy],
        employment_histories_attributes: %i[id company_id details from to profession _destroy],
        education_histories_attributes: %i[id university_id details from to subject _destroy],
        employee_skills_attributes: %i[id skill_id level _destroy]
      )
    end

    def set_params_update_session_developers
      params.require(:developer).permit(
        developer_frameworks_attributes: %i[id framework_id level _destroy],
        developer_projects_attributes: %i[id project_id _destroy],
        developer_programming_languages_attributes: %i[id programming_language_id level _destroy]
      )
    end
  end
end
