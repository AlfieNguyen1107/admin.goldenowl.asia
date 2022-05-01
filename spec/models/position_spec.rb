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
require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
