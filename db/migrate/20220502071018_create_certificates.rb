class CreateCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :certificates do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
    add_index :certificates, :name
    add_index :certificates, :rating
  end
end
