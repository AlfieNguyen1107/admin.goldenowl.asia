class CreateSoftwareCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :software_categories do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
    add_index :software_categories, :name
  end
end
