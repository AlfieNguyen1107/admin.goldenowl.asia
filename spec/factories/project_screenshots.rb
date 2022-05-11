# == Schema Information
#
# Table name: project_screenshots
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_project_screenshots_on_image       (image)
#  index_project_screenshots_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
FactoryBot.define do
  factory :project_screenshot do
    project { nil }
    image { "MyString" }
  end
end
