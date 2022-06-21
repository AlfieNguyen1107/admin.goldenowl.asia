class CreateAnnualLeaves < ActiveRecord::Migration[6.0]
  def change
    create_table :annual_leaves do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer    :standard_paid_time_off,  default: 0
      t.integer    :seniority,               default: 0
      t.integer    :extra_paid_time_off,     default: 0
      t.integer    :total_paid_time_off,     default: 0
      t.decimal    :total_leave_days,        default: 0
      t.decimal    :remaining_paid_time_off, default: 0

      t.timestamps
    end
  end
end
