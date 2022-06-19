# frozen_string_literal: true

module Employees
  class CertificatesController < BaseController
    before_action :set_certificate, only: %i[delete]

    def add
      render :add
    end

    def create
      certificate_params.each do |certificate|
        CertificateEmployee.find_or_create_by(certificate_id: certificate[:certificate_id],
                                              year: certificate[:year],
                                              employee_id: @employee.id,
                                              score: certificate[:score])
      end
      render :update_list_certificates
    end

    def delete
      @certificate.destroy
      render :update_list_certificates
    end

    private

    def set_certificate
      @certificate = CertificateEmployee.find(params[:id])
    end

    def certificate_params
      params.require(:employee)[:certificates]
    end
  end
end
