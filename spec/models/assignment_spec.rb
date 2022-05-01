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
require 'rails_helper'

RSpec.describe Assignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
