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
class Contact < ApplicationRecord
  include ResizeImage

  has_one :client, as: :contactable, dependent: :destroy
  has_one_attached :image

  validates :company_homepage_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), if: -> { company_homepage_url.present? }
  validates :company_linkedin_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), if: -> { company_linkedin_url.present? }
  validates :personal_linkedin_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), if: -> { personal_linkedin_url.present? }
  validates :personal_facebook_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), if: -> { personal_facebook_url.present? }
  validates :personal_twitter_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), if: -> { personal_twitter_url.present? }

  resize_image_config(
    thumb: [128, 128]
  )
end
