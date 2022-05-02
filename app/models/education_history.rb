# == Schema Information
#
# Table name: education_histories
#
#  id            :bigint           not null, primary key
#  degree        :string
#  details       :text
#  from          :date
#  subject       :string
#  to            :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint           not null
#  university_id :bigint           not null
#
# Indexes
#
#  index_education_histories_on_degree         (degree)
#  index_education_histories_on_employee_id    (employee_id)
#  index_education_histories_on_subject        (subject)
#  index_education_histories_on_university_id  (university_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (university_id => universities.id)
#
class EducationHistory < ApplicationRecord
  belongs_to :university
  belongs_to :employee
end
