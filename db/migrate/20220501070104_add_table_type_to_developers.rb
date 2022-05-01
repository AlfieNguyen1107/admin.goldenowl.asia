class AddTableTypeToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :type, :string, default: "Developer"
    add_index :developers, :type
  end
end
