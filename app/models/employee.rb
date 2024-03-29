# == Schema Information
#
# Table name: employees
#
#  id                    :bigint           not null, primary key
#  career_objectives     :text
#  contract_signing_date :date
#  contract_status       :integer
#  current_address       :string
#  email                 :string
#  emp_number            :integer
#  employment_status     :integer
#  full_name             :string
#  genger                :integer
#  joined_date           :date
#  phone_number          :string
#  registered_address    :string
#  working_arrangement   :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  position_id           :bigint           not null
#
# Indexes
#
#  index_employees_on_contract_status      (contract_status)
#  index_employees_on_email                (email)
#  index_employees_on_emp_number           (emp_number)
#  index_employees_on_employment_status    (employment_status)
#  index_employees_on_full_name            (full_name)
#  index_employees_on_genger               (genger)
#  index_employees_on_position_id          (position_id)
#  index_employees_on_working_arrangement  (working_arrangement)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#
class Employee < ApplicationRecord
  include ResizeImage

  has_many :developers, as: :employable, dependent: :destroy
  has_many :project_coordinators, as: :employable, dependent: :destroy
  has_many :education_histories, dependent: :destroy
  has_many :employment_histories, dependent: :destroy
  has_many :certificate_employees, dependent: :destroy
  has_many :certificates, through: :certificate_employees
  has_many :employee_skills, dependent: :destroy
  has_many :skills, through: :employee_skills
  has_many :employee_tools, dependent: :destroy
  has_many :tools, through: :employee_tools
  belongs_to :position
  has_one_attached :image
  has_many :item_histories, dependent: :destroy
  has_many :items, through: :item_histories
  has_many :leave_of_absence_letters, dependent: :destroy
  has_one  :annual_leave, dependent: :destroy
  has_one  :user, dependent: :destroy

  accepts_nested_attributes_for :user, allow_destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  enum employment_status: { active: 0, retired: 1 }
  enum contract_status: { probation: 0, fulltime: 1, parttime: 2 }
  enum working_arrangement: { inoffice: 0, remote: 1, freelancer: 2 }

  delegate :name, to: :position, prefix: :position, allow_nil: true

  scope :except_employee, ->(id) { where.not(id: id) }

  validates :full_name, presence: true

  after_commit :update_annual_leave, on: %i[create update]

  accepts_nested_attributes_for :employee_tools,
                                :employee_skills,
                                :education_histories,
                                :employment_histories,
                                :certificate_employees,
                                allow_destroy: true

  resize_image_config(
    thumb: [128, 128]
  )

  def self.active_employees_count
    where(employment_status: Employee.employment_statuses[:active]).count
  end

  private

  def update_annual_leave
    annual_leave = AnnualLeave.find_or_initialize_by(employee_id: self)
    DayLeavesCalculationService.call(
      contract_signing_date: contract_signing_date,
      annual_leave: annual_leave,
      employee: self
    )
  end
end
