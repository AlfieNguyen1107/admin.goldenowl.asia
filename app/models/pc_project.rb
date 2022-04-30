# == Schema Information
#
# Table name: pc_projects
#
#  id                     :bigint           not null, primary key
#  finished_date          :date
#  join_date              :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  project_coordinator_id :bigint           not null
#  project_id             :bigint           not null
#
# Indexes
#
#  index_pc_projects_on_project_coordinator_id  (project_coordinator_id)
#  index_pc_projects_on_project_id              (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_coordinator_id => project_coordinators.id)
#  fk_rails_...  (project_id => projects.id)
#
class PcProject < ApplicationRecord
  belongs_to :project_coordinator
  belongs_to :project
end
