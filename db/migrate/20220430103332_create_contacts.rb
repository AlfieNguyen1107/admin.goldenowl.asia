class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :primary_phone_number
      t.string :company_homepage_url
      t.string :company_linkedin_url
      t.string :personal_linkedin_url
      t.string :personal_facebook_url
      t.string :personal_twitter_url

      t.timestamps
    end
    add_index :contacts, :full_name
  end
end
