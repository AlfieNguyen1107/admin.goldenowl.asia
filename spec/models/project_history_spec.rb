# == Schema Information
#
# Table name: project_histories
#
#  id               :bigint           not null, primary key
#  details          :text
#  frameworks       :string
#  from             :date
#  name             :string
#  order            :integer
#  position         :string
#  responsibilities :string
#  skills           :string
#  team_size        :integer
#  to               :date
#  tools            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id       :bigint           not null
#  developer_id     :bigint           not null
#
# Indexes
#
#  index_project_histories_on_company_id    (company_id)
#  index_project_histories_on_developer_id  (developer_id)
#  index_project_histories_on_name          (name)
#  index_project_histories_on_position      (position)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (developer_id => developers.id)
#
require 'rails_helper'

RSpec.describe ProjectHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
