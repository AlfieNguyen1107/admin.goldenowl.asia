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
FactoryBot.define do
  factory :skill do
    name { "MyString" }
    skill_category { nil }
    order { 1 }
  end
end
