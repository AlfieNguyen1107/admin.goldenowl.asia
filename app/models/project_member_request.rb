# == Schema Information
#
# Table name: project_member_requests
#
#  id              :bigint           not null, primary key
#  billable        :boolean
#  engagement_type :integer
#  expected_date   :date
#  position        :string
#  requested_date  :date
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  project_id      :bigint           not null
#
# Indexes
#
#  index_project_member_requests_on_engagement_type  (engagement_type)
#  index_project_member_requests_on_position         (position)
#  index_project_member_requests_on_project_id       (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class ProjectMemberRequest < ApplicationRecord
  has_many :project_member_assignments, dependent: :destroy
  belongs_to :project
  enum status: { open: 0, filled: 1 }
  enum engagement_type: { fulltime: 0, parttime: 1, hourly: 2, free: 3, fixed: 4 }
end
