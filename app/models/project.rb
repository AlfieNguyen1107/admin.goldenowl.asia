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
class Project < ApplicationRecord
  DAYS_FROM_NOW = [10, 30, 60].freeze
  enum industry: { sport: 0, ecommerce: 1, finance: 2, education: 3, manufacturing: 4, medical: 5, health_fitness: 6 }
  enum status: { planning: 0, ongoing: 1, finished: 2, archived: 3 }

  acts_as_taggable_on :software_categories
  has_many :project_teches, dependent: :destroy
  has_many :teches, through: :project_teches
  has_many :development_types_projects, dependent: :destroy
  has_many :developer_projects, dependent: :destroy
  has_many :developers, through: :developer_projects
  has_many :project_frameworks, dependent: :destroy
  has_many :frameworks, through: :project_frameworks
  has_many :project_tools, dependent: :destroy
  has_many :tools, through: :project_tools
  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills
  has_many :pc_projects, dependent: :destroy
  has_many :project_coordinators, through: :pc_projects
  has_many :project_member_requests, dependent: :destroy
  has_many :project_resources, dependent: :destroy
  has_many :project_screenshots, dependent: :destroy
  has_one_attached :image
  belongs_to :client

  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true
  validates :status, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :deployment, presence: true

  scope :active_projects, -> { where(status: Project.statuses[:ongoing]) }
  scope :filter_development_type, ->(development_type_ids) { where(development_type_id: development_type_ids) }
  scope :filter_industry, ->(industry) { where(industry: industry) }
  scope :search, ->(query) { where('lower(name) LIKE ? OR lower(deployment) LIKE ?', "%#{query.downcase}%", "%#{query.downcase}%") }

  def rank_to_s
    if rank.positive?
      (64 + rank).chr
    else
      'unset'
    end
  end

  def current_pc
    pc_projects.order(created_at: :desc).first&.project_coordinator
  end

  def assign_pc(project_coordinator)
    pc_projects.create project_coordinator: project_coordinator, join_date: Time.zone.today
  end
end
