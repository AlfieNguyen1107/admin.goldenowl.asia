class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :employee, index: true
    add_column :users, :role, :integer, default: 0
  end
end
