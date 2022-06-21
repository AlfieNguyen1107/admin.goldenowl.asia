# frozen_string_literal: true

module Employees
  class SkillsController < BaseController
    before_action :set_skill, only: %i[destroy]

    def add
      render :add
    end

    def create
      skill_params['skills'].each do |param|
        skill = EmployeeSkill.find_or_initialize_by(skill_id: param['id'],
                                                    employee_id: params['employee_id'])
        skill.update(level: param['level'])
      end
      render :update_list_skills
    end

    def destroy
      @skill.destroy
      render :update_list_skills
    end

    private

    def set_skill
      @skill = EmployeeSkill.find(params[:id])
    end

    def skill_params
      params.require(:employee).permit(skills: %i[id level])
    end
  end
end
