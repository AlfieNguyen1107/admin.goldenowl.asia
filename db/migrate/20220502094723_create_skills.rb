class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.references :skill_category, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
    add_index :skills, :name
  end
end
