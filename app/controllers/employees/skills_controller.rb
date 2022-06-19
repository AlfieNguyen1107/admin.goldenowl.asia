# frozen_string_literal: true

module Employees
  class SkillsController < BaseController
    before_action :set_skill, only: %i[delete]

    def add
      render :add
    end

    def create
      skill_params.each do |skill|
        EmployeeSkill.find_or_create_by(skill_id: skill[:skill_id],
                                        employee_id: @employee.id,
                                        level: skill[:level])
      end
      render :update_list_skills
    end

    def delete
      @skill.destroy
      render :update_list_skills
    end

    private

    def set_skill
      @skill = EmployeeSkill.find(params[:id])
    end

    def skill_params
      params.require(:employee)[:skills]
    end
  end
end
