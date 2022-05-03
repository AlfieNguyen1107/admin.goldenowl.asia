# == Schema Information
#
# Table name: employment_histories
#
#  id              :bigint           not null, primary key
#  contract_status :integer
#  details         :text
#  from            :date
#  order           :integer
#  profession      :string
#  to              :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  employee_id     :bigint           not null
#
# Indexes
#
#  index_employment_histories_on_company_id       (company_id)
#  index_employment_histories_on_contract_status  (contract_status)
#  index_employment_histories_on_employee_id      (employee_id)
#  index_employment_histories_on_order            (order)
#  index_employment_histories_on_profession       (profession)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (employee_id => employees.id)
#
FactoryBot.define do
  factory :employment_history do
    profession { Faker::Job.title }
    details { Faker::Lorem.paragraph.capitalize }
    from { "2022-05-02" }
    to { "2022-05-02" }
    contract_status { EmploymentHistory.contract_statuses.keys.map(&:to_sym).sample }
    order { rand(5) }
    association :employee
    association :company
  end
end
