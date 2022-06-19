# frozen_string_literal: true

module Developers
  class ProjectsController < BaseController
    before_action :set_project, only: %i[delete]

    def add
      render :add
    end

    def create
      project_params['project_ids'].each do |project_id|
        DeveloperProject.find_or_create_by(project_id: project_id, developer_id: @developer.id)
      end
      render :update_list_project
    end

    def delete
      @project.destroy
      render :update_list_project
    end

    private

    def set_project
      @project = DeveloperProject.find_by(developer_id: @developer.id, project_id: params[:id])
    end

    def project_params
      params.require(:developer).permit(project_ids: [])
    end
  end
end
