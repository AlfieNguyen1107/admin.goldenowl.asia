class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_technology_options
  before_action :prepare_projects, only: %i[index]
  def index
    filter_params
    project_filter
    @pagy, @projects = pagy(@projects, items: per_page)
  end

  def show
    @pagy, @projects = pagy(Project, items: per_page)
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_technology_options
    @frontend_options = Tech.frontend.pluck(:name, :id)
    @backend_options = Tech.backend.pluck(:name, :id)
    @db_options = Tech.db.pluck(:name, :id)
    @client_options = Client.pluck(:name, :id)
    @development_type_options = DevelopmentType.pluck(:name, :id)
  end

  def filter_params
    @development_type = params[:development_type_ids]
    @industry = params[:industry]
  end

  def project_filter
    @projects = @projects.search(params[:search]) if params[:search]
    if @development_type.present?
      @projects = @projects.joins(:development_types).filter_development_type(@development_type)
    end
    @projects = @projects.filter_industry(@industry) if @industry.present?
  end

  def project_params
    params.require(:project).permit(
      { tech_ids: [], development_type_ids: [] },
      :client_id,
      :name,
      :description,
      :deployment,
      :industry,
      :git_repo, :trello, :website, :image, :start_date, :end_date
    )
  end

  def prepare_projects
    @projects = Project.order(rank: :asc)
  end
end
