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
require 'rails_helper'

RSpec.describe SoftwareCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
