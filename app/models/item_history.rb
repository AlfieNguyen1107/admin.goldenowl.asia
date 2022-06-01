# == Schema Information
#
# Table name: item_histories
#
#  id          :bigint           not null, primary key
#  description :string
#  end_date    :date
#  start_date  :date
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint           not null
#  item_id     :bigint           not null
#
# Indexes
#
#  index_item_histories_on_employee_id  (employee_id)
#  index_item_histories_on_item_id      (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (item_id => items.id)
#
class ItemHistory < ApplicationRecord
  belongs_to  :item, optional: true
  belongs_to  :employee, optional: true

  delegate :name, :code, :image, to: :item, prefix: :item, allow_nil: true
  delegate :full_name, to: :employee, prefix: :employee, allow_nil: true
  scope :search_code, ->(code) { where('lower(code) LIKE ?', "%#{code.downcase}%") }
  after_create_commit :create_status_item
  after_update_commit :update_status_item
  after_destroy_commit :destroy_status_item

  private

  def create_status_item
    item.update(status: 1)
  end

  def update_status_item
    item.update(status: 0) unless status.zero?
  end

  def destroy_status_item
    item.update(status: 0) if status.zero?
  end
end
