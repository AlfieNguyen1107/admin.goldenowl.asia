class AddGraduationYearToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :graduation_year, :integer
  end
end
