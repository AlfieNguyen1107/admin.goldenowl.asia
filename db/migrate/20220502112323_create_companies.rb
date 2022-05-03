class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :registration_number

      t.timestamps
    end
    add_index :companies, :name
    add_index :companies, :registration_number
  end
end
