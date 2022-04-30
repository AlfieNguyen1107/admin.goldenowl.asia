class AddTypeToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :employable_id, :integer
    add_column :developers, :employable_type, :string
    add_index :developers, :employable_id
    add_index :developers, :employable_type
  end
end
