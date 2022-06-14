# frozen_string_literal: true

module Developers
  class DeveloperProjectsController < BaseController
    def update
      flash[:notice] = "#{@developer.update(set_params_developer_project) ? 'Successfully' : 'Unsuccessfully'} update project" if params[:developer]
      redirect_to developer_path(@developer)
    end

    def add
      respond_to do |format|
        format.js { render 'add', layout: false }
      end
    end

    private

    def set_params_developer_project
      params.require(:developer).permit(developer_projects_attributes: %i[id project_id _destroy])
    end
  end
end
