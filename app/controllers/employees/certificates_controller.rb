# frozen_string_literal: true

module Employees
  class CertificatesController < BaseController
    before_action :set_certificate, only: %i[destroy update]

    def add
      render :add
    end

    def create
      certificate_params['certificates'].each do |param|
        certificate = CertificateEmployee.find_or_initialize_by(certificate_id: param['id'],
                                                                employee_id: params['employee_id'])

        certificate.update(certificate_params_for_create(param))
      end
      render :update_list_certificates
    end

    def destroy
      @certificate.destroy
      render :update_list_certificates
    end

    def update
      @certificate.update(certificate_employee_params)
      render :update
    end

    private

    def set_certificate
      @certificate = CertificateEmployee.find(params[:id])
    end

    def certificate_params_for_create(param)
      param.permit(:year, :score)
    end

    def certificate_employee_params
      params['certificate_employee'].permit(:id, :year, :score)
    end

    def certificate_params
      params.require(:employee).permit(certificates: %i[id year score])
    end
  end
end
