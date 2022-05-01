class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.date :from_date
      t.date :to_date
      t.references :assigned_to, null: false, foreign_key: { to_table: "developers"}
      t.references :assigned_by, null: false, foreign_key: { to_table: "employees"}

      t.timestamps
    end
    add_index :assignments, :name
  end 
end
