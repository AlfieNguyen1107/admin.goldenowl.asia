class CreateAssignmentScores < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_scores do |t|
      t.string :name
      t.integer :score
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :assignment_scores, :name
    add_index :assignment_scores, :score
  end
end
