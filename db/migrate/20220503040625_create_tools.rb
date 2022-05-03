class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.references :skill_category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tools, :name
  end
end
