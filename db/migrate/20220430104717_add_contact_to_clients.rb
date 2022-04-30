class AddContactToClients < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :contactable, polymorphic: true, null: true
  end
end
