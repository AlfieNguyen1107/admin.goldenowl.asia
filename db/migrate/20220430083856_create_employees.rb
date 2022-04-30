class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :current_address
      t.integer :emp_number
      t.string :phone_number
      t.string :registered_address
      t.date :joined_date

      t.timestamps
    end
    add_index :employees, :full_name
    add_index :employees, :emp_number
  end
end
