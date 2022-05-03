# == Schema Information
#
# Table name: employees
#
#  id                  :bigint           not null, primary key
#  career_objectives   :text
#  contract_status     :integer
#  current_address     :string
#  email               :string
#  emp_number          :integer
#  employment_status   :integer
#  full_name           :string
#  genger              :integer
#  joined_date         :date
#  phone_number        :string
#  registered_address  :string
#  working_arrangement :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  position_id         :bigint           not null
#
# Indexes
#
#  index_employees_on_contract_status      (contract_status)
#  index_employees_on_email                (email)
#  index_employees_on_emp_number           (emp_number)
#  index_employees_on_employment_status    (employment_status)
#  index_employees_on_full_name            (full_name)
#  index_employees_on_genger               (genger)
#  index_employees_on_position_id          (position_id)
#  index_employees_on_working_arrangement  (working_arrangement)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#
class Employee < ApplicationRecord
  has_many :developers, as: :employable
  has_many :project_coordinators, as: :employable
  has_many :education_histories, dependent: :destroy
  has_many :employment_histories, dependent: :destroy
  has_many :certificate_employees, dependent: :destroy
  has_many :certificates, through: :certificate_employees
  has_many :employee_skills
  has_many :skills, through: :employee_skills
  belongs_to :position

  enum employment_status: { active: 0, retired: 1 }
  enum contract_status: { probation: 0, fulltime: 1, parttime: 2 }
  enum working_arrangement: { inoffice: 0, remote: 1, freelancer: 2 }

  def self.active_employees_count
    where(employment_status: Employee.employment_statuses[:active]).count
  end
end
