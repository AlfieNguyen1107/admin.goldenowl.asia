# == Schema Information
#
# Table name: skills
#
#  id                :bigint           not null, primary key
#  name              :string
#  order             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  skill_category_id :bigint           not null
#
# Indexes
#
#  index_skills_on_name               (name)
#  index_skills_on_skill_category_id  (skill_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_category_id => skill_categories.id)
#
class Skill < ApplicationRecord
  belongs_to :skill_category

  scope :skill_except, ->(id) { where.not(id: id) }

  delegate :name, to: :skill_category, prefix: :skill_category, allow_nil: true

  validates :name, presence: true
end
