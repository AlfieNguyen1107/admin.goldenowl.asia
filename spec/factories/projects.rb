# == Schema Information
#
# Table name: projects
#
#  id               :bigint           not null, primary key
#  deployment       :string
#  description      :string           not null
#  end_date         :date
#  git_repo         :string
#  industry         :integer
#  name             :string           not null
#  rank             :integer          default(0)
#  start_date       :date
#  status           :integer          default("planning")
#  task_tracker_url :string
#  website          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  client_id        :bigint
#
# Indexes
#
#  index_projects_on_client_id  (client_id)
#  index_projects_on_name       (name) UNIQUE
#  index_projects_on_rank       (rank)
#  index_projects_on_status     (status)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
FactoryBot.define do
  factory :project do
    name { Faker::Lorem.words.join(' ').capitalize }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.in_date_period }
    rank { (1..5).to_a.sample }
    end_date { Time.zone.today }
    deployment { 'MyString' }
    website { 'MyString' }
    status { Project.statuses.keys.map(&:to_sym).sample }
    client
  end
end
