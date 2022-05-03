# == Schema Information
#
# Table name: skill_categories
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  order                   :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  skill_category_group_id :bigint           not null
#
# Indexes
#
#  index_skill_categories_on_name                     (name)
#  index_skill_categories_on_skill_category_group_id  (skill_category_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_category_group_id => skill_category_groups.id)
#
require 'rails_helper'

RSpec.describe SkillCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
