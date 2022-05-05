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
require 'rails_helper'

RSpec.describe ProjectMemberRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
