class AddRankToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :rank, :integer, default: 0
    add_index :projects, :rank
    add_column :projects, :status, :integer, default: 0
    add_index :projects, :status
  end
end
