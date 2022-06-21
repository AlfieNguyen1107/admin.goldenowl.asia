# == Schema Information
#
# Table name: leave_of_absence_letters
#
#  id                    :bigint           not null, primary key
#  end_date              :datetime         not null
#  note                  :string
#  number_of_days        :decimal(, )
#  start_date            :datetime         not null
#  status                :integer          default("waiting for permission")
#  type_leave_of_absence :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  employee_id           :bigint           not null
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
  enum type_leave_of_absence: { 'leave with permission': 0, 'leave without permission': 1 }
  enum status: { 'waiting for permission': 0, approved: 1, unapproved: 2 }

  belongs_to :employee

  delegate :full_name, to: :employee, prefix: :employee, allow_nil: true
  delegate :name, to: :'employee.position', prefix: :position, allow_nil: true

  validates :start_date, :end_date, presence: true

  validate :check_type_leave_of_absence_letter

  after_commit :update_annual_leave, on: %i[create update]

  private

  def update_annual_leave
    annual_leave = AnnualLeave.find_by(employee_id: employee)
    LeaveOfAbsenceLetterService.call(
      leave_of_absence_letter: self,
      employee: employee,
      annual_leave: annual_leave
    )
  end

  def check_type_leave_of_absence_letter
    return unless start_date.present? && end_date.present?
    return if number_of_days <= employee.annual_leave.remaining_paid_time_off || type_leave_of_absence == 'leave without permission'

    errors.add(:type_leave_of_absence, 'invalid')
  end
end
