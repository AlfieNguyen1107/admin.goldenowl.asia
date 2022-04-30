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
require 'rails_helper'

RSpec.describe ProjectCoordinator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
