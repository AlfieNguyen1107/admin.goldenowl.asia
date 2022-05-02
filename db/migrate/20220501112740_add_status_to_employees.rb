class AddStatusToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :employment_status, :integer
    add_index :employees, :employment_status
    add_column :employees, :contract_status, :integer
    add_index :employees, :contract_status
    add_column :employees, :working_arrangement, :integer
    add_index :employees, :working_arrangement
  end
end
