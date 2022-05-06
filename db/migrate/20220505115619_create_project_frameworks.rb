class CreateProjectFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_frameworks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :framework, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
