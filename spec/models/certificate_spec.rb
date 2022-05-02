# == Schema Information
#
# Table name: certificates
#
#  id         :bigint           not null, primary key
#  name       :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_certificates_on_name    (name)
#  index_certificates_on_rating  (rating)
#
require 'rails_helper'

RSpec.describe Certificate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
