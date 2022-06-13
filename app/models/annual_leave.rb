# == Schema Information
#
# Table name: annual_leaves
#
#  id                      :bigint           not null, primary key
#  extra_paid_time_off     :integer          default(0)
#  remaining_paid_time_off :decimal(, )      default(0.0)
#  seniority               :integer          default(0)
#  standard_paid_time_off  :integer          default(0)
#  total_leave_days        :decimal(, )      default(0.0)
#  total_paid_time_off     :integer          default(0)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  employee_id             :bigint           not null
#
# Indexes
#
#  index_annual_leaves_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class AnnualLeave < ApplicationRecord
  belongs_to :employee

  delegate :full_name, :joined_date, :contract_signing_date, to: :employee, prefix: :employee, allow_nil: true
end
