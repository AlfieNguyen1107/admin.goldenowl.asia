class AddFieldsToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :genger, :integer
    add_index :employees, :genger
    add_column :employees, :email, :string
    add_index :employees, :email
    add_column :employees, :career_objectives, :text
  end
end
