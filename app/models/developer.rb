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
class Developer < ApplicationRecord
  belongs_to :employable, polymorphic: true
  delegate_missing_to :employable
  belongs_to :university, optional: true
  belongs_to :position
  has_many :developer_projects, dependent: :destroy
  has_many :projects, through: :developer_projects
  has_many :developer_programming_languages, dependent: :restrict_with_exception
  has_many :developer_frameworks, dependent: :destroy
  has_many :programming_languages, through: :developer_programming_languages
  has_many :frameworks, through: :developer_frameworks
  has_many :interns, foreign_key: 'mentor_id', dependent: :nullify, inverse_of: :mentor
  has_many :assignments, foreign_key: 'assigned_to_id', dependent: :destroy, inverse_of: :assigned_to
  has_many :project_histories, dependent: :destroy

  # validates :full_name, presence: true, uniqueness: true
  # validates :company_name, presence: true, uniqueness: true
  # validates :belong_team, presence: true
  # validates :senority, presence: true
  # validates :employable_id, uniqueness: true

  scope :not_have_current_project, -> { where(developer_projects: { current: nil }) }
  scope :have_current_project, -> { where('developer_projects.current = true') }

  def self.free_after_x_days(params)
    available_developer_ids = Developer.joins(:projects).where('current = true').group(:id).having('max(projects.end_date) <= ?', Time.zone.today + params).pluck(:id)

    where(id: available_developer_ids)
  end
end
