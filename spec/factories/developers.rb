# == Schema Information
#
# Table name: developers
#
#  id              :bigint           not null, primary key
#  belong_team     :string
#  company_name    :string
#  full_name       :string
#  graduation_year :integer
#  level           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  university_id   :bigint
#
# Indexes
#
#  index_developers_on_company_name   (company_name) UNIQUE
#  index_developers_on_full_name      (full_name) UNIQUE
#  index_developers_on_university_id  (university_id)
#
# Foreign Keys
#
#  fk_rails_...  (university_id => universities.id)
#
FactoryBot.define do
  factory :developer do
    belong_team { "MyString" }
    full_name { Faker::Name.name }
    level { [:junior, :mid, :senior].sample }
    graduation_year { Faker::Date.between(from: 20.years.ago, to: Date.today).year }
  end
end
