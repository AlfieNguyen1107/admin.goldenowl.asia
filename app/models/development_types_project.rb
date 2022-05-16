# == Schema Information
#
# Table name: development_types_projects
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  development_type_id :bigint           not null
#  project_id          :bigint           not null
#
# Indexes
#
#  index_development_types_projects_on_development_type_id  (development_type_id)
#  index_development_types_projects_on_project_id           (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (development_type_id => development_types.id)
#  fk_rails_...  (project_id => projects.id)
#
class DevelopmentTypesProject < ApplicationRecord
  belongs_to :project
  belongs_to :development_type
end
