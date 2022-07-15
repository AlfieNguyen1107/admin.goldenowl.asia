class RemoveIndexUniqueCompanyDeveloper < ActiveRecord::Migration[6.0]
  def change
    remove_index :developers, :company_name
    add_index :developers, :company_name
  end
end
