class CreateItemHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_histories do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.date       :start_date
      t.date       :end_date
      t.string     :description
      t.integer    :status, default: 0

      t.timestamps
    end
  end
end
