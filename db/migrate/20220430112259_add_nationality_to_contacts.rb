class AddNationalityToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :based_nationality, :string
    add_index :contacts, :based_nationality
    add_column :contacts, :current_living_country, :string
    add_index :contacts, :current_living_country
  end
end
