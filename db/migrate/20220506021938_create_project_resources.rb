class CreateProjectResources < ActiveRecord::Migration[6.0]
  def change
    create_table :project_resources do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :file
      t.string :url
      t.string :storage_name

      t.timestamps
    end
    add_index :project_resources, :name
    add_index :project_resources, :file
    add_index :project_resources, :url
    add_index :project_resources, :storage_name
  end
end
