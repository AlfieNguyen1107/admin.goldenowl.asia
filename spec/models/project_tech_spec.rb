# == Schema Information
#
# Table name: project_teches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  tech_id    :bigint           not null
#
# Indexes
#
#  index_project_teches_on_project_id  (project_id)
#  index_project_teches_on_tech_id     (tech_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (tech_id => teches.id)
#
require 'rails_helper'

RSpec.describe ProjectTech, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
