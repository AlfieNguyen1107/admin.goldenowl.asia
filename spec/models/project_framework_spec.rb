# == Schema Information
#
# Table name: project_frameworks
#
#  id           :bigint           not null, primary key
#  order        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  framework_id :bigint           not null
#  project_id   :bigint           not null
#
# Indexes
#
#  index_project_frameworks_on_framework_id  (framework_id)
#  index_project_frameworks_on_project_id    (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (framework_id => frameworks.id)
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe ProjectFramework, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
