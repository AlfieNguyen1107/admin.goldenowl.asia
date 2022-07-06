# frozen_string_literal: true

module Employees
  class EmploymentsController < BaseController
    before_action :set_employment, only: %i[update destroy]

    def add
      render :add
    end

    def create
      employment_params['employments'].each do |param|
        employment = EmploymentHistory.find_or_initialize_by(company_id: param['id'],
                                                             employee_id: @employee.id,
                                                             profession: param['profession'])

        employment.update(employment_params_for_create(param))
      end
      render :update_list_employments
    end

    def destroy
      @employment.destroy
      render :update_list_employments
    end

    def update
      @employment.update(employment_history_params)
      render :update
    end

    private

    def set_employment
      @employment = EmploymentHistory.find(params[:id])
    end

    def employment_params_for_create(param)
      param.permit(:details,
                   :from,
                   :to)
    end

    def employment_history_params
      params.permit(:profession, :details, :from, :to)
    end

    def employment_params
      params.require(:employee).permit(employments: %i[id profession details from to])
    end
  end
end
