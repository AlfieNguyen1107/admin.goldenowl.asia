# frozen_string_literal: true

module Employees
  class ToolsController < BaseController
    before_action :set_tool, only: %i[destroy]

    def add
      render :add
    end

    def create
      tool_params['tools'].each do |param|
        tool = EmployeeTool.find_or_initialize_by(tool_id: param['tool_id'],
                                                  employee_id: params['employee_id'])
        tool.update(level: param['level'])
      end
      render :update_list_tools
    end

    def destroy
      @tool.destroy
      render :update_list_tools
    end

    private

    def set_tool
      @tool = EmployeeTool.find(params[:id])
    end

    def tool_params
      params.require(:employee).permit(tools: %i[id level])
    end
  end
end
