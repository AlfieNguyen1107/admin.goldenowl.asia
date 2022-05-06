# == Schema Information
#
# Table name: software_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_software_categories_on_name  (name)
#
class SoftwareCategory < ApplicationRecord
end
