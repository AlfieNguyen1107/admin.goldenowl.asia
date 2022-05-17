class DropProjectsTechesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :projects_teches
  end
end
