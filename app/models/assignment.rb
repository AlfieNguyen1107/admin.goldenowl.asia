# == Schema Information
#
# Table name: assignments
#
#  id             :bigint           not null, primary key
#  description    :text
#  from_date      :date
#  name           :string
#  to_date        :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assigned_by_id :bigint           not null
#  assigned_to_id :bigint           not null
#
# Indexes
#
#  index_assignments_on_assigned_by_id  (assigned_by_id)
#  index_assignments_on_assigned_to_id  (assigned_to_id)
#  index_assignments_on_name            (name)
#
# Foreign Keys
#
#  fk_rails_...  (assigned_by_id => employees.id)
#  fk_rails_...  (assigned_to_id => developers.id)
#
class Assignment < ApplicationRecord
  belongs_to :assigned_to, class_name: 'Developer'
  belongs_to :assigned_by, class_name: 'Employee'
  has_many :assignment_scores, dependent: :destroy

  def average_score
    total = assignment_scores.count
    if total.positive?
      (assignment_scores.pluck(:score).sum.to_f / total).round(2)
    else
      0
    end
  end
end
