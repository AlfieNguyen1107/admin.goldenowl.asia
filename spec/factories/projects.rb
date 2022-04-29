# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  deployment  :string
#  description :string           not null
#  end_date    :date
#  git_repo    :string
#  industry    :integer
#  name        :string           not null
#  start_date  :date
#  trello      :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :bigint
#
# Indexes
#
#  index_projects_on_client_id  (client_id)
#  index_projects_on_name       (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.in_date_period }
    end_date { Date.today }
    deployment { "MyString" }
    website { "MyString" }
    client
  end
end
