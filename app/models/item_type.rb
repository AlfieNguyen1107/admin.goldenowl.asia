# == Schema Information
#
# Table name: item_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_item_types_on_name  (name)
#
class ItemType < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true
end
