# == Schema Information
#
# Table name: programming_languages
#
#  id              :bigint           not null, primary key
#  latest_version  :string
#  name            :string
#  year_of_release :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_programming_languages_on_latest_version  (latest_version)
#  index_programming_languages_on_name            (name)
#
FactoryBot.define do
  factory :programming_language do
    name { Faker::ProgrammingLanguage.name }
    year_of_release { rand(10).years.ago }
    latest_version { Faker::App.version }
  end
end
