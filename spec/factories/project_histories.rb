# == Schema Information
#
# Table name: project_histories
#
#  id           :bigint           not null, primary key
#  details      :text
#  from         :date
#  name         :string
#  order        :integer
#  position     :string
#  to           :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#  developer_id :bigint           not null
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
FactoryBot.define do
  factory :project_history do
    name { Faker::Commerce.product_name }
    position { Faker::Job.title }
    from { rand(20).years.ago }
    to { rand(2).years.ago }
    order { 1 }
    details { Faker::Lorem.paragraph }
    association :company
    association :developer
  end
end
