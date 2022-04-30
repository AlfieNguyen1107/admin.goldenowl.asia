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
FactoryBot.define do
  factory :pc_project do
    join_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    finished_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    association :project, factory: :project
    association :project_coordinator, factory: :project_coordinator
  end
end
