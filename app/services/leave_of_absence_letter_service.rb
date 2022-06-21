class LeaveOfAbsenceLetterService < ApplicationService
  def initialize(params)
    super()

    @leave_of_absence_letter = params[:leave_of_absence_letter]
    @employee = params[:employee]
    @annual_leave = params[:annual_leave]
  end

  def call
    update_annual_leave
  end

  private

  def update_annual_leave
    status = @leave_of_absence_letter.status
    SendMailLeaveOfAbsenceLetterWorker.perform_async(@leave_of_absence_letter.id, 'admin') if LeaveOfAbsenceLetter.statuses[status] != 0
    return unless LeaveOfAbsenceLetter.statuses[status] == 1

    number_of_days = @leave_of_absence_letter.number_of_days
    total_leave_days = @annual_leave.total_leave_days + number_of_days
    remaining_paid_time_off = if total_leave_days.zero?
                                @annual_leave.total_paid_time_off - number_of_days
                              else
                                @annual_leave.remaining_paid_time_off - number_of_days
                              end
    @annual_leave.update(total_leave_days: total_leave_days, remaining_paid_time_off: remaining_paid_time_off)
  end
end
