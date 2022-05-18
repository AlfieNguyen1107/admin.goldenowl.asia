# == Schema Information
#
# Table name: universities
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_universities_on_code  (code)
#  index_universities_on_name  (name)
#
class University < ApplicationRecord
  has_many :developers, dependent: :destroy
  has_many :education_histories, dependent: :destroy

  scope :filter_code_universities, ->(code) { where(code: code) }
end
