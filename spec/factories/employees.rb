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
FactoryBot.define do
  factory :employee do
    full_name { Faker::Name.name }
    current_address { "MyString" }
    emp_number { 1 }
    phone_number { "MyString" }
    registered_address { "MyString" }
    joined_date { "2022-04-30" }
    employment_status { Employee.employment_statuses.keys.map(&:to_sym).sample }
    contract_status { Employee.contract_statuses.keys.map(&:to_sym).sample }
    working_arrangement { Employee.working_arrangements.keys.map(&:to_sym).sample }
    association :position, factory: :position
    
  end
end
