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
require 'rails_helper'

RSpec.describe ProgrammingLanguage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
