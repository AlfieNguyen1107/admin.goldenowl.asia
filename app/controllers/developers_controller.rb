class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[show edit update destroy detail]
  before_action :set_project_options, only: %i[new edit]
  before_action :filter_params, :fetch_free_developer, only: %i[index]
  after_action :set_tech_stack, only: %i[create update]

  def index
    @developers = Developer.all
    developer_filter
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

  def set_tech_stack
    @developers = Developer.all
    @developers.each do |d|
      @temp = []
      @temp2 = []
      d.projects.each do |p|
        @temp += p.teches
      end
      @temp2 += @temp.uniq
      d.teches = @temp2.uniq
    end
  end

  def filter_params
    return unless params[:filter]

    @cur_day = params[:day]
    @cur_tech = params[:filter][:tech_ids]
  end

  def fetch_free_developer
    @developers_free = Developer.joins(:projects, :teches).not_have_current_project
    return unless @cur_tech.present?

    @developers_free = @developers_free.with_teches(@cur_tech)
  end

  def developer_filter
    @param_day = @cur_day.to_d
    @developers = Developer.joins(:projects, :teches)
    @developers = @developers.with_teches(@cur_tech) if @cur_tech.present?
    @developers = @developers.free_after_x_days(@param_day) if @cur_day.present?
    @developers = @developers.or(@developers_free)
    @developers = @developers.order(id: :asc)
  end

  def developer_params
    params.require(:developer).permit(
      { project_ids: [], tech_ids: [] },
      :full_name, :company_name, :belong_team, :level,
      developer_projects_attributes: %i[join_date current id]
    )
  end
end
