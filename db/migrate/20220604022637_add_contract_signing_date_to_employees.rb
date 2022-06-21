class AddContractSigningDateToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :contract_signing_date, :date
  end
end
