# == Schema Information
#
# Table name: developers
#
#  id              :bigint           not null, primary key
#  belong_team     :string
#  company_name    :string
#  employable_type :string
#  graduation_year :integer
#  senority        :string
#  type            :string           default("Developer")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employable_id   :integer
#  mentor_id       :bigint
#  position_id     :bigint           not null
#  university_id   :bigint
#
# Indexes
#
#  index_developers_on_company_name     (company_name) UNIQUE
#  index_developers_on_employable_id    (employable_id)
#  index_developers_on_employable_type  (employable_type)
#  index_developers_on_mentor_id        (mentor_id)
#  index_developers_on_position_id      (position_id)
#  index_developers_on_type             (type)
#  index_developers_on_university_id    (university_id)
#
# Foreign Keys
#
#  fk_rails_...  (mentor_id => developers.id)
#  fk_rails_...  (position_id => positions.id)
#  fk_rails_...  (university_id => universities.id)
#
require 'rails_helper'

RSpec.describe Intern, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
