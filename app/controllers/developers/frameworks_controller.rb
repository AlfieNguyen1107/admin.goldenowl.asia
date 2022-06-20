# frozen_string_literal: true

module Developers
  class FrameworksController < BaseController
    before_action :set_framework, only: %i[destroy]

    def add
      render :add
    end

    def create
      framework_params['frameworks'].each do |param|
        framework = DeveloperFramework.find_or_initialize_by(framework_id: param['franework_id'],
                                                             developer_id: @developer.id)
        framework.update(level: param['level'])
      end
      render :update_list_frameworks
    end

    def destroy
      @framework.destroy
      render :update_list_frameworks
    end

    private

    def set_framework
      @framework = DeveloperFramework.find(params[:id])
    end

    def framework_params
      params.require(:developer).permit(frameworks: %i[id level])
    end
  end
end
