# == Schema Information
#
# Table name: assignments
#
#  id             :bigint           not null, primary key
#  description    :text
#  from_date      :date
#  name           :string
#  to_date        :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assigned_by_id :bigint           not null
#  assigned_to_id :bigint           not null
#
# Indexes
#
#  index_assignments_on_assigned_by_id  (assigned_by_id)
#  index_assignments_on_assigned_to_id  (assigned_to_id)
#  index_assignments_on_name            (name)
#
# Foreign Keys
#
#  fk_rails_...  (assigned_by_id => employees.id)
#  fk_rails_...  (assigned_to_id => developers.id)
#
FactoryBot.define do
  factory :assignment do
    name { Faker::Lorem.word.capitalize }
    description { Faker::Lorem.paragraph }
    from_date { Faker::Date.backward(days: rand(100)) }
    to_date { Faker::Date.backward(days: rand(25)) }
    association :assigned_by, factory: :employee
    association :assigned_to, factory: :developer

    after :create do |a|
      a.assignment_scores.create name: "Prenstation", score: rand(10)
      a.assignment_scores.create name: "Effort", score: rand(10)
      a.assignment_scores.create name: "Code Quality", score: rand(10)
    end
  end
end
