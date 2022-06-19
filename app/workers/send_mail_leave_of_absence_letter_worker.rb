class SendMailLeaveOfAbsenceLetterWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  sidekiq_options queue: 'send_mail_leave_absence_letter'

  def perform(leave_of_absence_letter_id, role)
    leave_of_absence_letter = LeaveOfAbsenceLetter.find_by(id: leave_of_absence_letter_id)
    return LeaveOfAbsenceLetterMailer.send_mail_notification_by_admin(leave_of_absence_letter).deliver_now if role == 'admin'

    LeaveOfAbsenceLetterMailer.send_mail_notification_by_employee(leave_of_absence_letter).deliver_now
  end
end
