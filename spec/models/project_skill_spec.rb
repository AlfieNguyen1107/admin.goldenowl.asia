# == Schema Information
#
# Table name: project_skills
#
#  id         :bigint           not null, primary key
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  skill_id   :bigint           not null
#
# Indexes
#
#  index_project_skills_on_project_id  (project_id)
#  index_project_skills_on_skill_id    (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (skill_id => skills.id)
#
require 'rails_helper'

RSpec.describe ProjectSkill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
