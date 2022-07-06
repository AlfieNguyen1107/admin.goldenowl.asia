# frozen_string_literal: true

module Developers
  class ProjectHistoriesController < BaseController
    before_action :set_project, only: %i[destroy update]

    def add
      render :add
    end

    def create
      project_params['project_histories'].each do |param|
        project_history = ProjectHistory.find_or_initialize_by(name: param['name'], company_id: param['company_id'], developer_id: @developer.id)

        project_history.update(projects_history_params_for_create(params))
      end
      render :update_list_project_history
    end

    def destroy
      @project_history.destroy
      render :update_list_project_history
    end

    def update
      @project_history.update(projects_history_params)
      render :update
    end

    private

    def set_project
      @project_history = ProjectHistory.find_by(id: params[:id])
    end

    def projects_history_params_for_create(param)
      param.permit(:details,
                   :position,
                   :order,
                   :responsibilities,
                   :team_size,
                   :tools,
                   :frameworks,
                   :skills,
                   :from,
                   :to)
    end

    def projects_history_params
      params.permit(:name,
                    :company_id,
                    :position,
                    :team_size,
                    :detailss,
                    :responsibilities,
                    :tools,
                    :frameworks,
                    :skills,
                    :from,
                    :to)
    end

    def project_params
      params.require(:developer).permit(project_histories: %i[company_id name details position order responsibilities tools frameworks skills team_size from to])
    end
  end
end
