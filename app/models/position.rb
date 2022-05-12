# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_positions_on_ancestry  (ancestry)
#  index_positions_on_name      (name)
#
class Position < ApplicationRecord
  has_ancestry
  has_many :employees
  scope :filter_name_position, ->(name) { where(name: name) }
end
