class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[show edit update destroy detail]
  before_action :set_project_options, only: %i[new edit]
  before_action :filter_params, only: %i[index]

  def index
    @developers = Developer.all
    if params[:filter].present?
      @developers = FilterDeveloperService.call(params).payload
    end
    @pagy, @developers = pagy_array(@developers.uniq, items: per_page)
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
    @cur_tech = params[:filter][:tech_ids]
  end

  def developer_params
    params.require(:developer).permit(
      { project_ids: [], tech_ids: [] },
      :full_name, :company_name, :belong_team, :level,
      developer_projects_attributes: %i[join_date current id]
    )
  end
end
