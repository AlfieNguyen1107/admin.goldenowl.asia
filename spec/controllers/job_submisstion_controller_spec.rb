# require 'rails_helper'

# RSpec.describe JobSubmission do
#   describe 'POST create' do
#     context 'with invalid attributes' do
#       let(:empty_job_submission_params) { attributes_for(:job_submisstion, :invaid_job_submisstion) }

#       it 'Career was not created' do
#         expect { post :create, params: { job_submission: empty_job_submisstion_params } }.not_to change(JobSubmission, :count)
#       end
#     end

#     context 'Career was successfully created' do
#       let(:valid_job_submission_param) { attributes_for(:job_submisstion) }

#       it 'create a new job_submission' do
#         expect { post :create, params: { job_submission: valid_job_submission_param } }.to change { JobSubmission.count }.by(1)
#       end
#     end
#   end
# end
