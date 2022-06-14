# frozen_string_literal: true

module Employees
  class EmployeeEmploymentsController < BaseController
    def update
      flash[:notice] = "#{@employee.update(set_params_employee_employment) ? 'Successfully' : 'Unsuccessfully'} update certificate" if params[:employee]
      redirect_to developer_path(@employee.developers.first.id)
    end

    private

    def set_params_employee_employment
      params.require(:employee).permit(employment_histories_attributes: %i[id company_id details from to profession _destroy])
    end
  end
end
