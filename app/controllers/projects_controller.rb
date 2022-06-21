# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_technology_options
  before_action :upload_image, only: :update
  before_action :set_new_project, only: %i[new create]

  def index
    project_filter
    @pagy, @projects = pagy(@projects.order(start_date: :desc), items: per_page) if @projects.present?
    @year_groups = @projects.group_by { |project| project.start_date.year }
  end

  def show; end

  def new; end

  def edit; end

  def create
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params_upload)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def upload_image
    params[:project][:id]&.each do |id|
      image = @project.images.find_by(id: id)
      image.purge if image.present?
    end
    params[:project][:images]&.each do |img|
      @project.images.attach(img)
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize(@project)
  end

  def set_technology_options
    @client_options = Client.pluck(:name, :id)
  end

  def project_filter
    @projects = Project.all
    @industry = params[:industry]
    @projects = @projects.search(params[:search]) if params[:search]
    @projects = @projects.where(industry: @industry) if @industry.present?
    authorize(@projects)
  end

  def project_params
    params.require(:project).permit(
      { tech_ids: [] },
      { images: [] },
      :client_id,
      :name,
      :description,
      :deployment,
      :industry,
      :git_repo,
      :task_tracker_url,
      :website,
      :start_date,
      :end_date
    )
  end

  def project_params_upload
    params.require(:project).permit(
      { tech_ids: [] },
      :client_id,
      :name,
      :description,
      :deployment,
      :industry,
      :git_repo, :task_tracker_url, :website, :start_date, :end_date
    )
  end

  def set_new_project
    @project = Project.new((request.post? && project_params) || nil)
    authorize(@project)
  end
end
