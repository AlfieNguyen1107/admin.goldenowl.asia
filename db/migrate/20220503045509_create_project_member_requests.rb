class CreateProjectMemberRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :project_member_requests do |t|
      t.string :position
      t.integer :engagement_type
      t.date :requested_date
      t.date :expected_date
      t.boolean :billable
      t.integer :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
    add_index :project_member_requests, :position
    add_index :project_member_requests, :engagement_type
  end
end
