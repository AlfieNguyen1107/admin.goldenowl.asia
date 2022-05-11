# == Schema Information
#
# Table name: project_screenshots
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_project_screenshots_on_image       (image)
#  index_project_screenshots_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe ProjectScreenshot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
