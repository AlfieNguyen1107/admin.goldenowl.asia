class LeaveOfAbsenceLetterMailer < ApplicationMailer
  def send_mail_notification_by_admin(leave_of_absence_letter)
    @leave_of_absence_letter = leave_of_absence_letter
    mail(
      from: ENV['SENDGRID_USERNAME'],
      to: leave_of_absence_letter.employee.email,
      subject: "Leave Of Absence Letter Of #{leave_of_absence_letter.employee.full_name}"
    )
  end

  def send_mail_notification_by_employee(leave_of_absence_letter)
    @leave_of_absence_letter = leave_of_absence_letter
    mail(
      from: leave_of_absence_letter.employee.email,
      to: ENV['SENDGRID_USERNAME'],
      subject: "Leave Of Absence Letter Of #{leave_of_absence_letter.employee.full_name}"
    )
  end
end
