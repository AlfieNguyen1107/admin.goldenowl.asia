class CreateInterns < ActiveRecord::Migration[6.0]
  def change
    create_table :interns do |t|

      t.timestamps
    end
  end
end
