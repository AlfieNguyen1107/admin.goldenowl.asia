class AddUniversityIdToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_reference :developers, :university, foreign_key: true
  end
end
