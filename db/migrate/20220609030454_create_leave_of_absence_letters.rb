class CreateLeaveOfAbsenceLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_of_absence_letters do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer    :type_leave_of_absence
      t.datetime   :start_date, null: false
      t.datetime   :end_date, null: false
      t.decimal    :number_of_days
      t.string     :note
      t.integer    :status, default: 0

      t.timestamps
    end
  end
end
