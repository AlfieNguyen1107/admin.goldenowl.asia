# == Schema Information
#
# Table name: assignment_scores
#
#  id            :bigint           not null, primary key
#  name          :string
#  score         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  assignment_id :bigint           not null
#
# Indexes
#
#  index_assignment_scores_on_assignment_id  (assignment_id)
#  index_assignment_scores_on_name           (name)
#  index_assignment_scores_on_score          (score)
#
# Foreign Keys
#
#  fk_rails_...  (assignment_id => assignments.id)
#
require 'rails_helper'

RSpec.describe AssignmentScore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
