# frozen_string_literal: true

class DevelopersController < ApplicationController
  before_action :set_project_options, only: %i[new edit]
  before_action :set_data_association, only: %i[new create edit]
  before_action :set_date_year, only: %i[new create edit]
  before_action :set_developer, only: %i[show edit destroy detail reset_type]
  before_action :set_new_developer, only: %i[new create]
  before_action :set_developer_collection, only: %i[index]

  def index
    @senority = Developer.pluck(:senority)
    @pagy, @developers = pagy_array(@developers, items: per_page)
  end

  def show
    @employee = @developer.employable
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file.pdf',
               template: 'developers/export.html.slim',
               layout: 'pdf',
               page_size: 'A4'
      end
    end
  end

  def new
    @project_options = Project.pluck(:name, :id)
  end

  def edit; end

  def create
    if @developer.save
      redirect_to @developer, notice: 'Developer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @developer.destroy
    redirect_to developers_url, notice: 'Developer was successfully destroyed.'
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
    authorize(@developer)
  end

  def set_project_options
    @project_options = Project.pluck(:name, :id)
  end

  def developer_params
    params.require(:developer).permit(:employable_id,
                                      :senority,
                                      :company_name,
                                      :belong_team,
                                      :type,
                                      :university_id,
                                      :graduation_year,
                                      :position_id).merge(employable_type: 'Employee')
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

  def set_new_developer
    @developer = Developer.new((request.post? && developer_params) || nil)
    authorize(@developer)
  end

  def set_developer_collection
    @developers = FilterDeveloperService.new(senority: params[:senority]).call.order(:id)
    authorize(@developers)
  end
end
