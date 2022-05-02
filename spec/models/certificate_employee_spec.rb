# == Schema Information
#
# Table name: certificate_employees
#
#  id             :bigint           not null, primary key
#  score          :string
#  year           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  certificate_id :bigint           not null
#  employee_id    :bigint           not null
#
# Indexes
#
#  index_certificate_employees_on_certificate_id  (certificate_id)
#  index_certificate_employees_on_employee_id     (employee_id)
#  index_certificate_employees_on_score           (score)
#  index_certificate_employees_on_year            (year)
#
# Foreign Keys
#
#  fk_rails_...  (certificate_id => certificates.id)
#  fk_rails_...  (employee_id => employees.id)
#
require 'rails_helper'

RSpec.describe CertificateEmployee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
