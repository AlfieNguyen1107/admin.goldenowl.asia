# frozen_string_literal: true

class InternsController < ApplicationController
  before_action :set_intern, only: %i[show edit update destroy detail update_type]
  before_action :set_project_options, only: %i[new edit]
  before_action :filter_params, only: %i[index]
  before_action :set_data_association, only: %i[new edit create]
  before_action :set_date_year, only: %i[new edit create]
  before_action :set_mentor, only: %i[new edit]

  def index
    @interns = Intern.all
    @interns = FilterInternService.call(params).payload if params[:filter].present?
    @pagy, @interns = pagy_array(@interns.uniq, items: per_page)
  end

  def show
    @pagy, @interns = pagy(Intern, items: per_page)
  end

  def new
    @project_options = Project.pluck(:name, :id)
    @intern = Intern.new
  end

  def edit; end

  def create
    @intern = Intern.new(intern_params)

    respond_to do |format|
      if @intern.save
        format.html { redirect_to @intern, notice: 'Intern was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @intern.update(intern_params)
        format.html { redirect_to @intern, notice: 'Intern was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @intern.destroy
    respond_to do |format|
      format.html { redirect_to interns_url, notice: 'Intern was successfully destroyed.' }
    end
  end

  def detail
    @pagy, @interns = pagy(Intern, items: per_page)
  end

  def update_type
    if @intern.update(type: Developer)
      redirect_to developer_path(@intern), notice: 'Update successfully'
    else
      redirect_to developer_path(@intern), notice: 'Update unsuccessfully'
    end
  end

  private

  def set_intern
    @intern = Intern.find(params[:id])
  end

  def set_project_options
    @project_options = Project.pluck(:name, :id)
  end

  def filter_params
    return unless params[:filter]

    @cur_day = params[:day]
  end

  def set_mentor
    @mentors = Developer.developers.map { |d| [d.full_name, d.id] }
  end

  def intern_params
    params.require(:intern).permit(:employable_id, :belong_team, :university_id, :graduation_year, :position_id, :mentor_id).merge(employable_type: 'Employee')
  end

  def set_data_association
    @universities = University.all.map { |u| [u.name, u.id] }
    @positions = Position.all.uniq.map { |p| [p.name, p.id] }
    @employee_id = Developer.all.map(&:employable_id)
    @employable = Employee.except_employee(@employee_id).map { |e| [e.full_name, e.id] }
  end

  def set_date_year
    @years = ((Date.current.year - 30)..Date.current.year).to_a
  end
end
