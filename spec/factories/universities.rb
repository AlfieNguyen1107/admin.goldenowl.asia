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
FactoryBot.define do
  factory :university do
    name { Faker::Educator.university }
    code { "MyString" }
  end
end
