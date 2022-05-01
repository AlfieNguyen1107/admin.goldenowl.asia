class AddAncestryToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :ancestry, :string
    add_index :positions, :ancestry
  end
end
