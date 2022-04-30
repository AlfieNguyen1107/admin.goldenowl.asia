class CreateProjectCoordinators < ActiveRecord::Migration[6.0]
  def change
    create_table :project_coordinators do |t|
      t.references :employable, polymorphic: true, null: false
      t.integer :level

      t.timestamps
    end
    add_index :project_coordinators, :level
  end
end
