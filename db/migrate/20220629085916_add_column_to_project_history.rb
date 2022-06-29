class AddColumnToProjectHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :project_histories, :team_size, :integer
    add_column :project_histories, :responsibilities, :string
    add_column :project_histories, :tools, :string
    add_column :project_histories, :frameworks, :string
    add_column :project_histories, :skills, :string
  end
end
