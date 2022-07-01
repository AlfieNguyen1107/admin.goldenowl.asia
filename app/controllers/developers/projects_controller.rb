# frozen_string_literal: true

module Developers
  class ProjectsController < BaseController
    before_action :set_developer_project, only: %i[destroy]
    before_action :set_project, only: %i[update]

    def add
      render :add
    end

    def create
      project_params['projects'].each do |project|
        DeveloperProject.find_or_create_by(project_id: project[:id], developer_id: @developer.id)
      end
      render :update_list_project
    end

    def destroy
      @developer_project.destroy
      render :update_list_project
    end

    def update
      @project.update(status: 'finished')
    end

    private

    def set_developer_project
      @developer_project = DeveloperProject.find_by(developer_id: @developer.id, project_id: params[:id])
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:developer).permit(projects: [:id])
    end
  end
end
