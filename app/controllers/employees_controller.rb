class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit destroy update add_account_employee]
  before_action :set_positions, only: %i[new edit create update]
  before_action :set_new_employee, only: %i[new create]
  before_action :set_employee_collection, only: %i[index]

  def index
    @pagy, @employees = pagy(@employees, item: per_page)
  end

  def new; end

  def create
    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def show
    @location_address = Geocoder.search(@employee.current_address)
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: 'Employee was successfully destroyed.'
  end

  def add_account_employee
    user = User.find_or_initialize_by(employee_id: @employee.id)
    user.update(user_params)
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
    authorize(@employee)
  end

  def employee_params
    params.require(:employee).permit(
      :full_name,
      :image,
      :email,
      :current_address,
      :emp_number,
      :phone_number,
      :registered_address,
      :employment_status,
      :employment_status,
      :contract_status,
      :working_arrangement,
      :career_objectives,
      :position_id,
      :joined_date,
      :contract_signing_date
    )
  end

  def set_positions
    @positions = Position.all.map { |p| [p.name, p.id] }
  end

  def user_params
    params.permit(
      :email,
      :password
    )
  end

  def set_new_employee
    @employee = Employee.new((request.post? && employee_params) || nil)
    authorize(@employee)
  end

  def set_employee_collection
    @employees = Employee.order(id: :asc)
    authorize(@employees)
  end
end
