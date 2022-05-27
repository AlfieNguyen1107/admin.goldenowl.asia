# == Schema Information
#
# Table name: items
#
#  id           :bigint           not null, primary key
#  code         :string
#  description  :string
#  image        :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :bigint
#  item_type_id :bigint           not null
#
# Indexes
#
#  index_items_on_employee_id   (employee_id)
#  index_items_on_item_type_id  (item_type_id)
#  index_items_on_name          (name)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (item_type_id => item_types.id)
#
class Item < ApplicationRecord
  include ResizeImage

  belongs_to :item_type
  belongs_to :employee, optional: true
  has_one_attached :image

  validates :name, presence: true
  validates :code, presence: true

  delegate :full_name, to: :employee, prefix: 'employee', allow_nil: true
  delegate :name, to: :item_type, prefix: 'item_type', allow_nil: true

  resize_image_config(
    thumb: [128, 128]
  )
end
