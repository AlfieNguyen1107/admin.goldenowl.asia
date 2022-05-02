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
FactoryBot.define do
  factory :certificate do
    name { Faker::FunnyName.four_word_name }
    rating { rand(10) }
  end
end
