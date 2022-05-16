# == Schema Information
#
# Table name: development_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DevelopmentType < ApplicationRecord
  has_many :projects, through: :development_types_projects

  validates :name, uniqueness: true
end
