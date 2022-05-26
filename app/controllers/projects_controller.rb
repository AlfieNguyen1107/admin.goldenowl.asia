# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_technology_options
  before_action :upload_image, only: :update

  def index
    project_filter
    @pagy, @projects = pagy(@projects, items: per_page) if @projects.present?
    @year_groups = @projects.group_by { |project| project.end_date.year }
  end

  def show
    @pagy, @projects = pagy(@projects, items: per_page)
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
      if @project.update(project_params_upload)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
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
    @client_options = Client.pluck(:name, :id)
  end

  def project_filter
    @projects = Project.all
    @industry = params[:industry]
    @projects = @projects.search(params[:search]) if params[:search]
    @projects = @projects.filter_industry(@industry) if @industry.present?
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
end
