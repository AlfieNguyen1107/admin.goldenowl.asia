# frozen_string_literal: true

module Developers
  class DeveloperFrameworksController < BaseController
    def update
      flash[:notice] = "#{@developer.update(set_params_developer_framework) ? 'Successfully' : 'Unsuccessfully'} update framework" if params[:developer]
      redirect_to developer_path(@developer)
    end

    private

    def set_params_developer_framework
      params.require(:developer).permit(developer_frameworks_attributes: %i[id framework_id level _destroy])
    end
  end
end
