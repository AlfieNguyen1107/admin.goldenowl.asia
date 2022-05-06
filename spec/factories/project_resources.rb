# == Schema Information
#
# Table name: project_resources
#
#  id           :bigint           not null, primary key
#  file         :string
#  name         :string
#  storage_name :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :bigint           not null
#
# Indexes
#
#  index_project_resources_on_file          (file)
#  index_project_resources_on_name          (name)
#  index_project_resources_on_project_id    (project_id)
#  index_project_resources_on_storage_name  (storage_name)
#  index_project_resources_on_url           (url)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
FactoryBot.define do
  factory :project_resource do
    project { nil }
    name { "MyString" }
    file { "MyString" }
    url { "MyString" }
    storage_name { "MyString" }
  end
end
