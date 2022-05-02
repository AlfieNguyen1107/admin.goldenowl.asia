class CreateEducationHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :education_histories do |t|
      t.references :university, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.string :subject
      t.date :from
      t.date :to
      t.text :details

      t.timestamps
    end
    add_index :education_histories, :subject
  end
end
