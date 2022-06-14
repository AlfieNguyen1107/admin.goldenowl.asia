# frozen_string_literal: true

module Employees
  class EmployeeEducationsController < BaseController
    def update
      flash[:notice] = "#{@employee.update(set_params_employee_education) ? 'Successfully' : 'Unsuccessfully'} update education" if params[:employee]
      redirect_to developer_path(@employee.developers.first.id)
    end

    private

    def set_params_employee_education
      params.require(:employee).permit(education_histories_attributes: %i[id university_id details from to subject _destroy])
    end
  end
end
