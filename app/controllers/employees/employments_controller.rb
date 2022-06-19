# frozen_string_literal: true

module Employees
  class EmploymentsController < BaseController
    before_action :set_employment, only: %i[delete]

    def add
      render :add
    end

    def create
      employment_params.each do |employment|
        EmploymentHistory.find_or_create_by(company_id: employment[:company_id],
                                            profession: employment[:profession],
                                            employee_id: @employee.id,
                                            details: employment[:details],
                                            from: employment[:from].to_sentence,
                                            to: employment[:to].to_sentence)
      end
      render :update_list_employments
    end

    def delete
      @employment.destroy
      render :update_list_employments
    end

    private

    def set_employment
      @employment = EmploymentHistory.find(params[:id])
    end

    def employment_params
      params.require(:employee)[:employments]
    end
  end
end
