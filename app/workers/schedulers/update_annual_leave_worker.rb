require 'sidekiq-scheduler'

class Schedulers::UpdateAnnualLeaveWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Time.zone = 'Hanoi'
    Employee.all.each do |e|
      e.update(updated_at: Time.zone.now)
    end
  end
end
