class AddCompanyToEmploymentHistory < ActiveRecord::Migration[6.0]
  def change
    add_reference :employment_histories, :company, null: false, foreign_key: true
    remove_column :employment_histories, :company_name
  end
end
