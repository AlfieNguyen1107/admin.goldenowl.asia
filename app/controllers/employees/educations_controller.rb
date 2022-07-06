# frozen_string_literal: true

module Employees
  class EducationsController < BaseController
    before_action :set_education, only: %i[update destroy]

    def add
      render :add
    end

    def create
      education_params['educations'].each do |param|
        education = EducationHistory.find_or_initialize_by(university_id: param['id'],
                                                           employee_id: @employee.id,
                                                           subject: param['subject'])

        education.update(education_params_for_create(param))
      end
      render :update_list_educations
    end

    def destroy
      @education.destroy
      render :update_list_educations
    end

    def update
      @education.update(education_history_params)
      render :update
    end

    private

    def set_education
      @education = EducationHistory.find(params[:id])
    end

    def education_params_for_create(param)
      param.permit(:details,
                   :from,
                   :to)
    end

    def education_history_params
      params.permit(:subject, :details, :from, :to)
    end

    def education_params
      params.require(:employee).permit(educations: %i[id subject details from to])
    end
  end
end
