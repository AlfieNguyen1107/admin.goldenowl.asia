class CreateFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.references :programming_language, null: false, foreign_key: true
      t.integer :year_of_release
      t.string :latest_version

      t.timestamps
    end
    add_index :frameworks, :name
    add_index :frameworks, :latest_version
  end
end
