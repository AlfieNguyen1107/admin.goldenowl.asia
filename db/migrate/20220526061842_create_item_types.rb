class CreateItemTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :item_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :item_types, :name
  end
end
