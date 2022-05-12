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
#  skill_category_id       :bigint
#
# Indexes
#
#  index_frameworks_on_latest_version           (latest_version)
#  index_frameworks_on_name                     (name)
#  index_frameworks_on_programming_language_id  (programming_language_id)
#  index_frameworks_on_skill_category_id        (skill_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (programming_language_id => programming_languages.id)
#  fk_rails_...  (skill_category_id => skill_categories.id)
#
class Framework < ApplicationRecord
  belongs_to :programming_language
  belongs_to :skill_category, optional: true
  scope :search_framework, ->(id) { where(programming_language_id: id) }
end
