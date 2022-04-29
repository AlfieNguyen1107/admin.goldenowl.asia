# == Schema Information
#
# Table name: universities
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_universities_on_code  (code)
#  index_universities_on_name  (name)
#
require 'rails_helper'

RSpec.describe University, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
