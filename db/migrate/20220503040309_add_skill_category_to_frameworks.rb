class AddSkillCategoryToFrameworks < ActiveRecord::Migration[6.0]
  def change
    add_reference :frameworks, :skill_category, null: true, foreign_key: true
  end
end
