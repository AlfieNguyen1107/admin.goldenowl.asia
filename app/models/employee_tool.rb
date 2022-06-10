# == Schema Information
#
# Table name: employee_tools
#
#  id          :bigint           not null, primary key
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint           not null
#  tool_id     :bigint           not null
#
# Indexes
#
#  index_employee_tools_on_employee_id  (employee_id)
#  index_employee_tools_on_level        (level)
#  index_employee_tools_on_tool_id      (tool_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (tool_id => tools.id)
#
class EmployeeTool < ApplicationRecord
  belongs_to :employee
  belongs_to :tool

  scope :set_level, ->(employee_id, tool_id) { find_by(employee_id: employee_id, tool_id: tool_id)&.level }

  enum level: { fresher: 0, junior: 1, mid: 2, senior: 3 }
end
