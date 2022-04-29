# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_positions_on_name  (name)
#
class Position < ApplicationRecord
end
