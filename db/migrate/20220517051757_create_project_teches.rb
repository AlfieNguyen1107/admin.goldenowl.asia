class CreateProjectTeches < ActiveRecord::Migration[6.0]
  def change
    create_table :project_teches do |t|
      t.references :project, null: false, foreign_key: true
      t.references :tech, null: false, foreign_key: true

      t.timestamps
    end
  end
end
