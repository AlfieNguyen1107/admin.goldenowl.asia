class CreateProjectScreenshots < ActiveRecord::Migration[6.0]
  def change
    create_table :project_screenshots do |t|
      t.references :project, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
    add_index :project_screenshots, :image
  end
end
