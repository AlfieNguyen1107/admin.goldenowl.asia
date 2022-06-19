# frozen_string_literal: true

module Employees
  class EducationsController < BaseController
    before_action :set_education, only: %i[delete]

    def add
      render :add
    end

    def create
      education_params.each do |education|
        EducationHistory.find_or_create_by(university_id: education[:university_id],
                                           subject: education[:subject],
                                           employee_id: @employee.id,
                                           from: education[:from].to_sentence,
                                           to: education[:to].to_sentence)
      end
      render :update_list_educations
    end

    def delete
      @education.destroy
      render :update_list_educations
    end

    private

    def set_education
      @education = EducationHistory.find(params[:id])
    end

    def education_params
      params.require(:employee)[:educations]
    end
  end
end
