# == Schema Information
#
# Table name: developers
#
#  id              :bigint           not null, primary key
#  belong_team     :string
#  company_name    :string
#  employable_type :string
#  graduation_year :integer
#  level           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  employable_id   :integer
#  position_id     :bigint           not null
#  university_id   :bigint
#
# Indexes
#
#  index_developers_on_company_name     (company_name) UNIQUE
#  index_developers_on_employable_id    (employable_id)
#  index_developers_on_employable_type  (employable_type)
#  index_developers_on_position_id      (position_id)
#  index_developers_on_university_id    (university_id)
#
# Foreign Keys
#
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
  has_many :developer_teches, dependent: :destroy
  has_many :teches, through: :developer_teches
  has_many :developer_programming_languages, dependent: :destroy
  has_many :developer_frameworks, dependent: :destroy
  has_many :programming_languages, through: :developer_programming_languages
  has_many :frameworks, through: :developer_frameworks

  accepts_nested_attributes_for :developer_projects, allow_destroy: true

  # validates :full_name, presence: true, uniqueness: true
  # validates :company_name, presence: true, uniqueness: true
  # validates :belong_team, presence: true
  validates :level, presence: true

  after_save :set_tech_stack

  scope :with_teches, ->(params) { where('tech_id = ?', params) }
  scope :not_have_current_project, -> { where('developer_projects.current IS NULL') }
  scope :have_current_project, -> { where('developer_projects.current = true') }

  def self.free_after_x_days(params)
    available_developer_ids = Developer.joins(:projects).where('current = true').group(:id).having('max(projects.end_date) <= ?', Date.today + params).pluck(:id)

    where(id: available_developer_ids)
  end

  private

  def set_tech_stack
    @project_technology = []
    projects.each do |p|
      @project_technology += p.teches
    end
    self.teches = @project_technology.uniq
  end
end
