class CreateProjectHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :project_histories do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true
      t.string :position
      t.date :from
      t.date :to
      t.integer :order
      t.text :details
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :project_histories, :name
    add_index :project_histories, :position
  end
end
