# frozen_string_literal: true

module Employees
  class EmployeeCertificatesController < BaseController
    def update
      flash[:notice] = "#{@employee.update(set_params_employee_certificate) ? 'Successfully' : 'Unsuccessfully'} update certificate" if params[:employee]
      redirect_to developer_path(@employee.developers.first.id)
    end

    private

    def set_params_employee_certificate
      params.require(:employee).permit(certificate_employees_attributes: %i[id certificate_id year score _destroy])
    end
  end
end
