# == Schema Information
#
# Table name: developer_frameworks
#
#  id                  :bigint           not null, primary key
#  level               :integer
#  start_counting_year :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  developer_id        :bigint           not null
#  framework_id        :bigint           not null
#
# Indexes
#
#  index_developer_frameworks_on_developer_id         (developer_id)
#  index_developer_frameworks_on_framework_id         (framework_id)
#  index_developer_frameworks_on_level                (level)
#  index_developer_frameworks_on_start_counting_year  (start_counting_year)
#
# Foreign Keys
#
#  fk_rails_...  (developer_id => developers.id)
#  fk_rails_...  (framework_id => frameworks.id)
#
class DeveloperFramework < ApplicationRecord
  belongs_to :developer
  belongs_to :framework
end
