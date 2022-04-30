class RemoveFullNameFromDevelopers < ActiveRecord::Migration[6.0]
  def up
    remove_column :developers, :full_name
  end

  def down
    add_column :developers, :full_name, :string
  end
end
