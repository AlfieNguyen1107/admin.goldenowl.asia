class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_programming_languages do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :programming_language, null: false, foreign_key: true, index: {name: 'ind_dev_prog_fk'}
      t.integer :level
      t.integer :start_counting_year

      t.timestamps
    end
    add_index :developer_programming_languages, :level
    add_index :developer_programming_languages, :start_counting_year
  end
end
