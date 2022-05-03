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
require 'rails_helper'

RSpec.describe SkillCategoryGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
