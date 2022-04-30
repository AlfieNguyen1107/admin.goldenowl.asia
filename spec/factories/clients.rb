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
FactoryBot.define do
  factory :client do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    hq { Faker::Address.country }
  end
end
