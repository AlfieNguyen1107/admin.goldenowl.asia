# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("employee")
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employee_id            :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_employee_id           (employee_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  scope :search, ->(search_string) { where('lower(email) LIKE ?', "%#{search_string.downcase}%") }

  enum role: { employee: 0, admin: 1 }

  belongs_to :employee, optional: true

  delegate :full_name, to: :employee, prefix: :employee, allow_nil: true

  def user_name
    email.split('@')[0]
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])
    user || User.create(
      uid: access_token['uid'],
      provider: access_token['provider'],
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
  end

  def admin?
    return true if role == 'admin'

    false
  end
end
