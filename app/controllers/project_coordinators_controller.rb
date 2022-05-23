class ProjectCoordinatorsController < ApplicationController
  before_action :set_project_coordinator, only: %i[show edit update destroy]
  before_action :set_employable, only: %i[new edit create]
  def index
    @project_coordinators = ProjectCoordinator.all
    @pagy, @project_coordinators = pagy_array(@project_coordinators, items: per_page)
  end

  def show; end

  def new
    @project_coordinator = ProjectCoordinator.new
  end

  def edit; end

  def create
    @project_coordinator = ProjectCoordinator.new(project_coordinator_params)

    respond_to do |format|
      if @project_coordinator.save
        format.html { redirect_to @project_coordinator, notice: 'ProjectCoordinator was successfully created.' }
        format.json { render :show, status: :created, location: @project_coordinator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_coordinator.update(project_coordinator_params)
        format.html { redirect_to @project_coordinator, notice: 'ProjectCoordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_coordinator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_coordinator.destroy
    respond_to do |format|
      format.html { redirect_to project_coordinators_url, notice: 'ProjectCoordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project_coordinator
    @project_coordinator = ProjectCoordinator.find(params[:id])
  end

  def set_employable
    @employables = Employee.pluck(:full_name, :id)
  end

  def project_coordinator_params
    params.require(:project_coordinator).permit(:employable_id, :level).merge(employable_type: 'Employee')
  end
end
