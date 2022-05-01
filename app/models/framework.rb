# == Schema Information
#
# Table name: frameworks
#
#  id                      :bigint           not null, primary key
#  latest_version          :string
#  name                    :string
#  year_of_release         :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  programming_language_id :bigint           not null
#
# Indexes
#
#  index_frameworks_on_latest_version           (latest_version)
#  index_frameworks_on_name                     (name)
#  index_frameworks_on_programming_language_id  (programming_language_id)
#
# Foreign Keys
#
#  fk_rails_...  (programming_language_id => programming_languages.id)
#
class Framework < ApplicationRecord
  belongs_to :programming_language
end
