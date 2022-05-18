class InternsController < ApplicationController
  before_action :set_intern, only: %i[show edit update destroy detail]
  before_action :set_project_options, only: %i[new edit]
  before_action :filter_params, only: %i[index]

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

  def intern_params
    params.require(:intern).permit(
      { project_ids: [] },
      :full_name, :company_name, :belong_team, :level,
      intern_projects_attributes: %i[join_date current id]
    )
  end
end
