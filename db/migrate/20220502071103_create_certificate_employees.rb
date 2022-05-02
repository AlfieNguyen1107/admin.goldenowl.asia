class CreateCertificateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :certificate_employees do |t|
      t.references :certificate, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.integer :year
      t.string :score

      t.timestamps
    end
    add_index :certificate_employees, :year
    add_index :certificate_employees, :score
  end
end
