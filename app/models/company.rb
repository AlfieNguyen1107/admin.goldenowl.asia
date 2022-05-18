# == Schema Information
#
# Table name: companies
#
#  id                  :bigint           not null, primary key
#  name                :string
#  registration_number :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_companies_on_name                 (name)
#  index_companies_on_registration_number  (registration_number)
#
class Company < ApplicationRecord
  has_many :project_histories, dependent: :destroy
  has_many :employment_histories, dependent: :destroy
end
