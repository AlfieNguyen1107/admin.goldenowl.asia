class CreateProgrammingLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.integer :year_of_release
      t.string :latest_version

      t.timestamps
    end
    add_index :programming_languages, :name
    add_index :programming_languages, :latest_version
  end
end
