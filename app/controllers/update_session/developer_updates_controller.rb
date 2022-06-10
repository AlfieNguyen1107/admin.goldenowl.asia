# frozen_string_literal: true

module UpdateSession
  class DeveloperUpdatesController < ApplicationController
    before_action :set_developer, only: %i[update_session_project
                                           update_session_programming_language
                                           update_session_framework]
    before_action :set_employee, only: %i[update_session_tool
                                          update_session_skill
                                          update_session_education
                                          update_session_employment
                                          update_session_certificate]

    def update_session_project
      if params[:developer].present? && @developer.update(set_params_update_session_project)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_programming_language
      if params[:developer].present? && @developer.update(set_params_update_session_programming_language)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_framework
      if params[:developer].present? && @developer.update(set_params_update_session_framework)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_tool
      if params[:employee].present? && @employee.update(set_params_update_session_tool)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_skill
      if params[:employee].present? && @employee.update(set_params_update_session_skill)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_education
      if params[:employee].present? && @employee.update!(set_params_update_session_education)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_employment
      if params[:employee].present? && @employee.update!(set_params_update_session_employment)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
      redirect_to developer_path(@developer)
    end

    def update_session_certificate
      if params[:employee].present? && @employee.update!(set_params_update_session_certificate)
        flash[:succes] = 'Successfully update session'
      else
        flash[:error] = 'Unsuccessfully update session'
      end
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

    def set_params_update_session_certificate
      params.require(:employee).permit(certificate_employees_attributes: %i[id certificate_id year score _destroy])
    end

    def set_params_update_session_employment
      params.require(:employee).permit(employment_histories_attributes: %i[id company_id details from to profession _destroy])
    end

    def set_params_update_session_education
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
  end
end
