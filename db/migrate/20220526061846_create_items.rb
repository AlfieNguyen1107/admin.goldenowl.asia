class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :item_type, null: false, foreign_key: true
      t.string     :name
      t.string     :description
      t.string     :image
      t.string     :code
      t.integer    :status, default: 0

      t.timestamps
    end
    add_index :items, :name
  end
end
