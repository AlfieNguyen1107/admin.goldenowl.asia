class CreateDeveloperFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_frameworks do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :framework, null: false, foreign_key: true
      t.integer :level
      t.integer :start_counting_year

      t.timestamps
    end
    add_index :developer_frameworks, :level
    add_index :developer_frameworks, :start_counting_year
  end
end
