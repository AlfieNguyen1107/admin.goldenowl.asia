class AddMentorToInterns < ActiveRecord::Migration[6.0]
  def change
    add_reference :developers, :mentor, null: true, foreign_key: { to_table: :developers }
  end
end
