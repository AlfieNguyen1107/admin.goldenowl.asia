class DeleteTech < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key "developer_teches", "developers"
    remove_foreign_key "developer_teches", "teches"
    remove_foreign_key "project_teches", "projects"
    remove_foreign_key "project_teches", "teches"
    remove_index "developer_teches", name: "index_developer_teches_on_developer_id"
    remove_index "developer_teches", name: "index_developer_teches_on_tech_id"
    remove_index "project_teches", name: "index_project_teches_on_project_id"
    remove_index "project_teches", name: "index_project_teches_on_tech_id"
    drop_table "developer_teches"
    drop_table "project_teches"
    drop_table "teches"
  end
end
