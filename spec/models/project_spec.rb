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
require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :rank }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :start_date }
    it { is_expected.to validate_presence_of :end_date }
    it { is_expected.to validate_presence_of :deployment }
    it { is_expected.to validate_presence_of :status }
  end

  describe 'assocation' do
    it { is_expected.to have_many(:developers) }
    it { is_expected.to belong_to(:client) }
  end

  context 'rank_to_s' do
    it 'convert rank to string' do
      project = FactoryBot.create(:project, rank: 1)
      expect(project.rank_to_s).to eq 'A'
    end

    it 'convert rank to unset' do
      project = FactoryBot.create(:project, rank: -1)
      expect(project.rank_to_s).to eq 'unset'
    end
  end
end
