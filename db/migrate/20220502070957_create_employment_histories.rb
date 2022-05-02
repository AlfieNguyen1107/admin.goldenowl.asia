class CreateEmploymentHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :employment_histories do |t|
      t.string :company_name
      t.string :profession
      t.date :from
      t.date :to
      t.integer :contract_status
      t.integer :order
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employment_histories, :company_name
    add_index :employment_histories, :profession
    add_index :employment_histories, :contract_status
    add_index :employment_histories, :order
  end
end
