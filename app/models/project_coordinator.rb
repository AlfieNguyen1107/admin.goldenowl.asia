# == Schema Information
#
# Table name: project_coordinators
#
#  id              :bigint           not null, primary key
#  employable_type :string           not null
#  level           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employable_id   :bigint           not null
#
# Indexes
#
#  index_project_coordinators_on_employable_type_and_employable_id  (employable_type,employable_id)
#  index_project_coordinators_on_level                              (level)
#
class ProjectCoordinator < ApplicationRecord
  belongs_to :employable, polymorphic: true
  delegate_missing_to :employable

  has_many :pc_projects, foreign_key: :project_coordinator_id, dependent: :destroy
  has_many :projects, through: :pc_projects

  def current_project
    projects.order(created_at: :desc).last
  end
end
