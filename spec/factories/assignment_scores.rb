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
FactoryBot.define do
  factory :assignment_score do
    name { "MyString" }
    score { 1 }
    assignment { nil }
  end
end
