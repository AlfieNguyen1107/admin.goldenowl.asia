# frozen_string_literal: true

module Employees
  class CertificatesController < BaseController
    before_action :set_certificate, only: %i[destroy]

    def add
      render :add
    end

    def create
      certificate_params['certificates'].each do |param|
        certificate = CertificateEmployee.find_or_initialize_by(certificate_id: param['id'],
                                                                employee_id: params['employee_id'])

        certificate.update(year: param['year'],
                           score: param[:score])
      end
      render :update_list_certificates
    end

    def destroy
      @certificate.destroy
      render :update_list_certificates
    end

    private

    def set_certificate
      @certificate = CertificateEmployee.find(params[:id])
    end

    def certificate_params
      params.require(:employee).permit(certificates: %i[id year score])
    end
  end
end
