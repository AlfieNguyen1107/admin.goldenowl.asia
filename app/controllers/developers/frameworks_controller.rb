# frozen_string_literal: true

module Developers
  class FrameworksController < BaseController
    before_action :set_framework, only: %i[delete]

    def add
      render :add
    end

    def create
      framework_params.each do |framework|
        DeveloperFramework.find_or_create_by(framework_id: framework[:framework_id],
                                             developer_id: @developer.id,
                                             level: framework[:level])
      end
      render :update_list_frameworks
    end

    def delete
      @framework.destroy
      render :update_list_frameworks
    end

    private

    def set_framework
      @framework = DeveloperFramework.find(params[:id])
    end

    def framework_params
      params.require(:developer)[:frameworks]
    end
  end
end
