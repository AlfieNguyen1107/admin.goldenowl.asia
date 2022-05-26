# frozen_string_literal: true

class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[show edit update destroy detail reset_type]
  before_action :set_project_options, only: %i[new edit]
  before_action :filter_params, only: %i[index]
  before_action :set_data_association, only: %i[new edit create]
  before_action :set_date_year, only: %i[new edit create]

  def index
    @senority = Developer.pluck(:senority)
    @developers = FilterDeveloperService.new(senority: params[:senority]).call.order(:id)

    @pagy, @developers = pagy_array(@developers, items: per_page)
  end

  def show
    @pagy, @developers = pagy(Developer, items: per_page)
  end

  def new
    @project_options = Project.pluck(:name, :id)
    @developer = Developer.new
  end

  def edit; end

  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Developer was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'Developer was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
    end
  end

  def detail
    @pagy, @developers = pagy(Developer, items: per_page)
  end

  def reset_type
    if @developer.update(type: Intern)
      redirect_to intern_path(@developer), notice: 'Update successfully'
    else
      redirect_to intern_path(@developer), notice: 'Update unsuccessfully'
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def set_project_options
    @project_options = Project.pluck(:name, :id)
  end

  def filter_params
    return unless params[:filter]

    @cur_day = params[:day]
  end

  def developer_params
    params.require(:developer).permit(:employable_id, :senority, :belong_team, :type, :university_id,
                                      :graduation_year, :position_id).merge(employable_type: 'Employee')
  end

  def set_data_association
    @universities = University.all.map { |u| [u.name, u.id] }
    @positions = Position.all.uniq.map { |p| [p.name, p.id] }
    @employable = Employee.all.map { |e| [e.full_name, e.id] }
  end

  def set_date_year
    @years = ((Date.current.year - 30)..Date.current.year).to_a
  end
end
