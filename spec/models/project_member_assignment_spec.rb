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
require 'rails_helper'

RSpec.describe ProjectMemberAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
