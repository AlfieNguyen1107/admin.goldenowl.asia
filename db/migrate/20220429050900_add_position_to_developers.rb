class AddPositionToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_reference :developers, :position, foreign_key: true
  end
end
