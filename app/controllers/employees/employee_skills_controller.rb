# frozen_string_literal: true

module Employees
  class EmployeeSkillsController < BaseController
    def update
      flash[:notice] = "#{@employee.update(set_params_employee_skill) ? 'Successfully' : 'Unsuccessfully'} update skill" if params[:employee]
      redirect_to developer_path(@employee.developers.first.id)
    end

    private

    def set_params_employee_skill
      params.require(:employee).permit(employee_skills_attributes: %i[id skill_id level _destroy])
    end
  end
end
