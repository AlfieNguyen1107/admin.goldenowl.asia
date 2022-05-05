class CreateProjectMemberAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :project_member_assignments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :project_member_request, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :shadow_by, null: true, foreign_key: { to_table: 'employees' }

      t.timestamps
    end
  end
end
