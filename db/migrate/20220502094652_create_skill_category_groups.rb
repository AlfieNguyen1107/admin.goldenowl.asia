class CreateSkillCategoryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_category_groups do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
    add_index :skill_category_groups, :name
  end
end
