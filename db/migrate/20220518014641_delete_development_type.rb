class DeleteDevelopmentType < ActiveRecord::Migration[6.0]
  def change
    remove_index "development_types_projects", name: "index_development_types_projects_on_development_type_id"
    remove_index "development_types_projects", name: "index_development_types_projects_on_project_id"
    remove_foreign_key "development_types_projects", "development_types"
    remove_foreign_key "development_types_projects", "projects"
    drop_table "development_types_projects"
    drop_table "development_types"
  end
end
