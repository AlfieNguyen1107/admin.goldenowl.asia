# == Schema Information
#
# Table name: teches
#
#  id         :bigint           not null, primary key
#  name       :string
#  tech_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tech < ApplicationRecord
  enum tech_type: { frontend: 0, backend: 1, db: 2 }
  has_many :project_teches, dependent: :destroy
  has_many :projects, through: :project_teches
  has_many :developer_teches, dependent: :destroy
  has_many :developers, through: :developer_teches
  validates :name, presence: true, uniqueness: true
  validates :tech_type, presence: true
end
