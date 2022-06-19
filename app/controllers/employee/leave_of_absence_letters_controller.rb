class Employee::LeaveOfAbsenceLettersController < ApplicationController
  before_action :set_leave_of_absence_letter, only: %i[show edit update destroy]
  before_action :set_new_leave_of_absence_letter, only: %i[new create]
  before_action :set_leave_of_absence_letter_collection, only: %i[index]
  before_action :set_form_selections, only: %i[new create edit]

  def index
    @leave_of_absence_letters = LeaveOfAbsenceLetter.where(employee_id: current_user.employee_id).order(id: :asc)
    @pagy, @leave_of_absence_letters = pagy(@leave_of_absence_letters, items: per_page)
  end

  def new; end

  def create
    if @leave_of_absence_letter.save
      redirect_to employee_leave_of_absence_letter_path(@leave_of_absence_letter), notice: 'Leave of absence letter was successfully created.'
      SendMailLeaveOfAbsenceLetterWorker.perform_async(@leave_of_absence_letter.id, current_user.role)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @leave_of_absence_letter.update(leave_of_absence_letter_params)
      redirect_to employee_leave_of_absence_letter_path(@leave_of_absence_letter), notice: 'Leave of absence letter successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @leave_of_absence_letter.destroy
    redirect_to employee_leave_of_absence_letters_path, notice: 'Leave of absence letter successfully destroyed.'
  end

  private

  def set_leave_of_absence_letter
    @leave_of_absence_letter = LeaveOfAbsenceLetter.find(params[:id])
    authorize(@leave_of_absence_letter)
  end

  def set_new_leave_of_absence_letter
    @leave_of_absence_letter = LeaveOfAbsenceLetter.new((request.post? && leave_of_absence_letter_params) || nil)
    authorize(@leave_of_absence_letter)
  end

  def set_leave_of_absence_letter_collection
    @leave_of_absence_letters = LeaveOfAbsenceLetter.order(id: :asc)
    authorize(@leave_of_absence_letters)
  end

  def leave_of_absence_letter_params
    params.require(:leave_of_absence_letter).permit(
      :employee_id,
      :type_leave_of_absence,
      :start_date,
      :end_date,
      :note,
      :number_of_days,
      :status
    )
  end

  def set_form_selections
    @employees = Employee.order(full_name: :asc).map { |emp| [emp.full_name, emp.id] }
  end
end
