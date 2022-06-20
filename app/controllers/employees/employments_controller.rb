# frozen_string_literal: true

module Employees
  class EmploymentsController < BaseController
    before_action :set_employment, only: %i[destroy]

    def add
      render :add
    end

    def create
      employment_params['employments'].each do |param|
        employment = EmploymentHistory.find_or_initialize_by(company_id: param['company_id'],
                                                             employee_id: params['employee_id'])

        employment.update(profession: param['profession'],
                          details: param['details'],
                          from: param[:from],
                          to: param[:to])
      end
      render :update_list_employments
    end

    def destroy
      @employment.destroy
      render :update_list_employments
    end

    private

    def set_employment
      @employment = EmploymentHistory.find(params[:id])
    end

    def employment_params
      params.require(:employee).permit(employments: %i[id profession details from to])
    end
  end
end
