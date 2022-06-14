# frozen_string_literal: true

module Employees
  class EmployeeToolsController < BaseController
    def update
      flash[:notice] = "#{@employee.update(set_params_employee_tools) ? 'Successfully' : 'Unsuccessfully'} update tool" if params[:employee]
      redirect_to developer_path(@employee.developers.first.id)
    end

    private

    def set_params_employee_tools
      params.require(:employee).permit(employee_tools_attributes: %i[id tool_id level _destroy])
    end
  end
end
