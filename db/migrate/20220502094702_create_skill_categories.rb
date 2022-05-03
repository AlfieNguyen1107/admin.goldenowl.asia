class CreateSkillCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.integer :order
      t.references :skill_category_group, null: false, foreign_key: true

      t.timestamps
    end
    add_index :skill_categories, :name
  end
end
