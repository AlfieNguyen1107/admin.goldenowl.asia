# frozen_string_literal: true

module Developers
  class ProjectHistoriesController < BaseController
    before_action :set_project, only: %i[destroy]

    def add
      render :add
    end

    def create
      project_params['project_histories'].each do |param|
        project_history = ProjectHistory.find_or_initialize_by(name: param['name'], company_id: param['company_id'], developer_id: @developer.id)

        project_history.update(details: param['details'],
                               position: param['position'],
                               order: param['order'],
                               responsibilities: param['responsibilities'],
                               team_size: param['team_size'],
                               tools: param['tools'],
                               frameworks: param['frameworks'],
                               skills: param['skills'],
                               from: param['from'],
                               to: param['to'])
      end
      render :update_list_project_history
    end

    def destroy
      @project_history.destroy
      render :update_list_project_history
    end

    private

    def set_project
      @project_history = ProjectHistory.find_by(id: params[:id])
    end

    def project_params
      params.require(:developer).permit(project_histories: %i[company_id name details position order responsibilities tools frameworks skills team_size from to])
    end
  end
end
