# == Schema Information
#
# Table name: project_tools
#
#  id         :bigint           not null, primary key
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  tool_id    :bigint           not null
#
# Indexes
#
#  index_project_tools_on_project_id  (project_id)
#  index_project_tools_on_tool_id     (tool_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (tool_id => tools.id)
#
FactoryBot.define do
  factory :project_tool do
    project { nil }
    tool { nil }
    order { 1 }
  end
end
