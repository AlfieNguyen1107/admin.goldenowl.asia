class CreateEmployeeTools < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_tools do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
    add_index :employee_tools, :level
  end
end
