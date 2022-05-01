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
FactoryBot.define do
  factory :position do
    name { "MyString" }
  end
end
