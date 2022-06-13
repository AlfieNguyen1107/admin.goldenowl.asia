class DayLeavesCalculationService < ApplicationService
  def initialize(params)
    super()

    @employee = params[:employee]
    @contract_signing_date = params[:contract_signing_date]
    @annual_leave = params[:annual_leave]
  end

  def call
    create_new_annual_leave
  end

  private

  def create_new_annual_leave
    return if @contract_signing_date.blank?

    day_off_on_month = @contract_signing_date.day <= 15 ? 1 : 0
    standard_paid_time_off = @contract_signing_date.year < Time.zone.today.year ? 12 : 12 - (@contract_signing_date.month - day_off_on_month)

    day_of_seniority = (((Time.zone.today.year * 12) + Time.zone.today.month + (Time.zone.today.day / 30.0) - (@employee.joined_date.year * 12) - @employee.joined_date.month - (@employee.joined_date.day / 30.0)) / 12) / 2
    seniority = day_of_seniority > 3 ? 3 : day_of_seniority

    extra_paid_time_off = if @contract_signing_date.year < Time.zone.today.year
                            Time.zone.today.month / 4
                          elsif @contract_signing_date.day <= 15
                            (Time.zone.today.month - @contract_signing_date.month + 1) / 4
                          else
                            (Time.zone.today.month - @contract_signing_date.month) / 4
                          end
    total_paid_time_off = standard_paid_time_off + seniority + extra_paid_time_off
    @annual_leave.update(
      employee_id: @employee.id,
      standard_paid_time_off: standard_paid_time_off,
      seniority: seniority,
      extra_paid_time_off: extra_paid_time_off,
      total_paid_time_off: total_paid_time_off,
      remaining_paid_time_off: total_paid_time_off.round
    )
  end
end
