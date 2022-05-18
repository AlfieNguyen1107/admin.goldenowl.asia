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
class ProjectMemberAssignment < ApplicationRecord
  belongs_to :employee, inverse_of: :project_member_assignments
  belongs_to :project_member_request
  belongs_to :shadow, class_name: 'Employee', foreign_key: 'shadow_by_id', optional: true, inverse_of: :project_member_assignments
end
