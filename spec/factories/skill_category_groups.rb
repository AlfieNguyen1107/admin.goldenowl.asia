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
FactoryBot.define do
  factory :skill_category_group do
    name { "MyString" }
    order { 1 }
  end
end
