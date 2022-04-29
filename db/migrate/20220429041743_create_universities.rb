class CreateUniversities < ActiveRecord::Migration[6.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
    add_index :universities, :name
    add_index :universities, :code
  end
end
