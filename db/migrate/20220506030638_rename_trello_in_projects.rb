class RenameTrelloInProjects < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :trello, :task_tracker_url
  end
end
