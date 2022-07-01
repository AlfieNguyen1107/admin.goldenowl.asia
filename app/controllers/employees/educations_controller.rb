# frozen_string_literal: true

module Employees
  class EducationsController < BaseController
    before_action :set_education, only: %i[destroy]

    def add
      render :add
    end

    def create
      education_params['educations'].each do |param|
        education = EducationHistory.find_or_initialize_by(university_id: param['id'],
                                                           employee_id: params['employee_id'])

        education.update(subject: param['subject'],
                         details: param['details'],
                         from: param['from'],
                         to: param['to'])
      end
      render :update_list_educations
    end

    def destroy
      @education.destroy
      render :update_list_educations
    end

    private

    def set_education
      @education = EducationHistory.find(params[:id])
    end

    def education_params
      params.require(:employee).permit(educations: %i[id subject details from to])
    end
  end
end
