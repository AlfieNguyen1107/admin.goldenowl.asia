# == Schema Information
#
# Table name: employee_skills
#
#  id           :bigint           not null, primary key
#  level        :integer
#  years_of_exp :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :bigint           not null
#  skill_id     :bigint           not null
#
# Indexes
#
#  index_employee_skills_on_employee_id  (employee_id)
#  index_employee_skills_on_skill_id     (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :employee_skill do
    employee { nil }
    skill { nil }
    level { 1 }
    years_of_exp { 1 }
  end
end
