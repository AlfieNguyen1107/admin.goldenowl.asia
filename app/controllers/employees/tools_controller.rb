# frozen_string_literal: true

module Employees
  class ToolsController < BaseController
    before_action :set_tool, only: %i[delete]

    def add
      render :add
    end

    def create
      tool_params.each do |tool|
        EmployeeTool.find_or_create_by(tool_id: tool[:tool_id],
                                       employee_id: @employee.id,
                                       level: tool[:level])
      end
      render :update_list_tools
    end

    def delete
      @tool.destroy
      render :update_list_tools
    end

    private

    def set_tool
      @tool = EmployeeTool.find(params[:id])
    end

    def tool_params
      params.require(:employee)[:tools]
    end
  end
end
