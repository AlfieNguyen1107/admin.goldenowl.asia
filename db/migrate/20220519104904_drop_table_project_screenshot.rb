class DropTableProjectScreenshot < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_screenshots
  end
end
