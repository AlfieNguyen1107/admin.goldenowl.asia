# == Schema Information
#
# Table name: skill_category_groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_skill_category_groups_on_name  (name)
#
class SkillCategoryGroup < ApplicationRecord
  has_many :skill_categories, dependent: :destroy
  has_many :skills, through: :skill_categories
end
