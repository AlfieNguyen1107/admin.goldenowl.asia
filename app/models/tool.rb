# == Schema Information
#
# Table name: tools
#
#  id                :bigint           not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  skill_category_id :bigint           not null
#
# Indexes
#
#  index_tools_on_name               (name)
#  index_tools_on_skill_category_id  (skill_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_category_id => skill_categories.id)
#
class Tool < ApplicationRecord
  belongs_to :skill_category
  has_many :employee_tools, dependent: :destroy
  has_many :employees, through: :employee_tools

  scope :filter_skill_category_tool, ->(id) { where(skill_category_id: id) }

  delegate :name, to: :skill_category, prefix: :skill_category, allow_nil: true
end
