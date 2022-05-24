# == Schema Information
#
# Table name: developer_programming_languages
#
#  id                      :bigint           not null, primary key
#  level                   :integer
#  start_counting_year     :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  developer_id            :bigint           not null
#  programming_language_id :bigint           not null
#
# Indexes
#
#  ind_dev_prog_fk                                               (programming_language_id)
#  index_developer_programming_languages_on_developer_id         (developer_id)
#  index_developer_programming_languages_on_level                (level)
#  index_developer_programming_languages_on_start_counting_year  (start_counting_year)
#
# Foreign Keys
#
#  fk_rails_...  (developer_id => developers.id)
#  fk_rails_...  (programming_language_id => programming_languages.id)
#
class DeveloperProgrammingLanguage < ApplicationRecord
  belongs_to :developer, dependent: :destroy
  belongs_to :programming_language, dependent: :destroy
end
