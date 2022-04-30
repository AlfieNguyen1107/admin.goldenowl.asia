# == Schema Information
#
# Table name: contacts
#
#  id                    :bigint           not null, primary key
#  company_homepage_url  :string
#  company_linkedin_url  :string
#  full_name             :string
#  personal_facebook_url :string
#  personal_linkedin_url :string
#  personal_twitter_url  :string
#  primary_phone_number  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_contacts_on_full_name  (full_name)
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
