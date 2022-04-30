class AlterPcProjectTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :pc_projects, :pcs
    rename_column :pc_projects, :pc_id, :project_coordinator_id
    add_column :pc_projects, :finished_date, :date

    add_foreign_key :pc_projects, :project_coordinators
  end
end
