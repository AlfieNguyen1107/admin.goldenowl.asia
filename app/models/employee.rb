# == Schema Information
#
# Table name: employees
#
#  id                 :bigint           not null, primary key
#  current_address    :string
#  emp_number         :integer
#  full_name          :string
#  joined_date        :date
#  phone_number       :string
#  registered_address :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  position_id        :bigint           not null
#
# Indexes
#
#  index_employees_on_emp_number   (emp_number)
#  index_employees_on_full_name    (full_name)
#  index_employees_on_position_id  (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#
class Employee < ApplicationRecord
  has_many :developers, as: :employable
  has_many :project_coordinators, as: :employable
  belongs_to :position
end
