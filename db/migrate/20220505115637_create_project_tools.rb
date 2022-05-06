class CreateProjectTools < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tools do |t|
      t.references :project, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
