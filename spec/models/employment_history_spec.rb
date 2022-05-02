# == Schema Information
#
# Table name: employment_histories
#
#  id              :bigint           not null, primary key
#  company_name    :string
#  contract_status :integer
#  details         :text
#  from            :date
#  order           :integer
#  profession      :string
#  to              :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employee_id     :bigint           not null
#
# Indexes
#
#  index_employment_histories_on_company_name     (company_name)
#  index_employment_histories_on_contract_status  (contract_status)
#  index_employment_histories_on_employee_id      (employee_id)
#  index_employment_histories_on_order            (order)
#  index_employment_histories_on_profession       (profession)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
require 'rails_helper'

RSpec.describe EmploymentHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
