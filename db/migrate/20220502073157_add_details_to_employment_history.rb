class AddDetailsToEmploymentHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :employment_histories, :details, :text
  end
end
