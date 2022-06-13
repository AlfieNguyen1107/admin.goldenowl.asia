# == Schema Information
#
# Table name: leave_of_absence_letters
#
#  id             :bigint           not null, primary key
#  end_date       :datetime         not null
#  note           :string
#  number_of_days :decimal(, )
#  reason         :integer
#  start_date     :datetime         not null
#  status         :integer          default("Đợi duyệt")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  employee_id    :bigint           not null
#
# Indexes
#
#  index_leave_of_absence_letters_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class LeaveOfAbsenceLetter < ApplicationRecord
  enum reason: { 'Nghĩ phép': 0, 'Không phép': 1 }
  enum status: { 'Đợi duyệt': 0, 'Đã duyệt': 1, 'Không được duyệt': 2 }

  belongs_to :employee

  delegate :full_name, to: :employee, prefix: :employee, allow_nil: true
  delegate :name, to: :'employee.position', prefix: :position, allow_nil: true

  after_commit :update_annual_leave, on: %i[create update]

  private

  def update_annual_leave
    return unless LeaveOfAbsenceLetter.statuses[status] == 1

    annual_leave = AnnualLeave.find_by(employee_id: employee)
    total_leave_days = + number_of_days
    remaining_paid_time_off = annual_leave.total_paid_time_off - number_of_days
    annual_leave.update(total_leave_days: total_leave_days, remaining_paid_time_off: remaining_paid_time_off)
  end
end
