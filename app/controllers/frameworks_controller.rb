class FrameworksController < ApplicationController
  before_action :set_framework, only: %i[edit show update destroy]

  def index
    @frameworks_all = Framework.all
    if params[:programming_language_name].present?
      @programming_language = ProgrammingLanguage.search_name_programming_language(params[:programming_language_name])
      @frameworks = Framework.search_framework(@programming_language.first.id)
    else
      @frameworks = Framework.all
    end
    @pagy, @frameworks = pagy(@frameworks.order(id: :ASC))
  end

  def create
    @framework = Framework.new(framework_params)
    if @framework.save
      redirect_to frameworks_path, notice: 'Framework was successfully created.'
    else
      redirect_to frameworks_path, notice: 'Framework was unsuccessfully created.'
    end
  end

  def new
    @framework = Framework.new
  end

  def show; end

  def edit; end

  def update
    if @framework.update(framework_params)
      redirect_to framework_path(@framework), notice: 'Framework was successfully updated.'
    else
      redirect_to framework_path(@framework), notice: 'Framework was unsuccessfully updated.'
    end
  end

  def destroy
    if @framework.destroy
      redirect_to frameworks_path, notice: 'Framework was successfully destroy.'
    else
      redirect_to frameworks_path, notice: 'Framework was unsuccessfully destroy.'
    end
  end

  private

  def set_framework
    @framework = Framework.find(params[:id])
  end

  def framework_params
   params.require(:framework).permit(:name, :programming_language_id, :year_of_release, :latest_version, :skill_category_id)
  end
end
