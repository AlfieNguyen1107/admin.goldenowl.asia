# == Schema Information
#
# Table name: contacts
#
#  id                     :bigint           not null, primary key
#  based_nationality      :string
#  company_homepage_url   :string
#  company_linkedin_url   :string
#  current_living_country :string
#  full_name              :string
#  personal_facebook_url  :string
#  personal_linkedin_url  :string
#  personal_twitter_url   :string
#  primary_phone_number   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_contacts_on_based_nationality       (based_nationality)
#  index_contacts_on_current_living_country  (current_living_country)
#  index_contacts_on_full_name               (full_name)
#
FactoryBot.define do
  factory :contact do
    full_name { Faker::Name.name }
    primary_phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
    company_homepage_url { Faker::Internet.url }
    company_linkedin_url { Faker::Internet.url }
    personal_linkedin_url { Faker::Internet.url }
    personal_facebook_url { Faker::Internet.url }
    personal_twitter_url { Faker::Internet.url }
    based_nationality { Nationality::NATIONALITY.sample }
    current_living_country { Nationality::NATIONALITY.sample }
  end
end
