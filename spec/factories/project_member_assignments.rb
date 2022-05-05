# == Schema Information
#
# Table name: project_member_assignments
#
#  id                        :bigint           not null, primary key
#  end_date                  :date
#  start_date                :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  employee_id               :bigint           not null
#  project_member_request_id :bigint           not null
#  shadow_by_id              :bigint
#
# Indexes
#
#  index_project_member_assignments_on_employee_id                (employee_id)
#  index_project_member_assignments_on_project_member_request_id  (project_member_request_id)
#  index_project_member_assignments_on_shadow_by_id               (shadow_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (project_member_request_id => project_member_requests.id)
#  fk_rails_...  (shadow_by_id => employees.id)
#
FactoryBot.define do
  factory :project_member_assignment do
    start_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    # association :shadow_by, factory: :employee
    association :employee
    association :project_member_request
  end
end
