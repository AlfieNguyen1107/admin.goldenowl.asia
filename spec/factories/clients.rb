# == Schema Information
#
# Table name: clients
#
#  id          :bigint           not null, primary key
#  address     :string
#  hq          :string
#  latitude    :float
#  longitude   :float
#  name        :string
#  nationality :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :client do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    hq { Faker::Address.country }
  end
end
