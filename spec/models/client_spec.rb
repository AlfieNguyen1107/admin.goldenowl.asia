# == Schema Information
#
# Table name: clients
#
#  id               :bigint           not null, primary key
#  address          :string
#  contactable_type :string
#  hq               :string
#  latitude         :float
#  longitude        :float
#  name             :string
#  nationality      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contactable_id   :bigint
#
# Indexes
#
#  index_clients_on_contactable_type_and_contactable_id  (contactable_type,contactable_id)
#
require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :hq }
  end
  
  describe 'assocation' do
    it { is_expected.to have_many(:projects) }
  end
end
