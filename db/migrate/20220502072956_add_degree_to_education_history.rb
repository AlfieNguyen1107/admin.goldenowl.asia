class AddDegreeToEducationHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :education_histories, :degree, :string
    add_index :education_histories, :degree
  end
end
