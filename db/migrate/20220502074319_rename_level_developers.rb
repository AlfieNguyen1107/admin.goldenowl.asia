class RenameLevelDevelopers < ActiveRecord::Migration[6.0]
  def change
    rename_column :developers, :level, :senority
  end
end
