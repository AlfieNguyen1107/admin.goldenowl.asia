class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit destroy update]
  before_action :set_positions, only: %i[new edit create update]

  def index
    @employees = Employee.all
    @pagy, @employees = pagy(@employees.order(id: :asc), item: per_page)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'employee was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_path, notice: 'Employee was successfully destroyed.' }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:full_name, :image, :email, :current_address, :emp_number, :phone_number, :registered_address, :employment_status, :employment_status, :contract_status,
                                     :working_arrangement, :career_objectives, :position_id)
  end

  def set_positions
    @positions = Position.all.map { |p| [p.name, p.id] }
  end
end
