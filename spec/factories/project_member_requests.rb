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
FactoryBot.define do
  factory :project_member_request do
    position { Faker::Job.title }
    engagement_type { ProjectMemberRequest.engagement_types.keys.map(&:to_sym).sample }
    requested_date { Faker::Date.in_date_period }
    expected_date { Faker::Date.in_date_period }
    billable { [false, true].sample }
    status { ProjectMemberRequest.statuses.keys.map(&:to_sym).sample }
    association :project
  end
end
