class FrameworksController < ApplicationController
  before_action :set_framework, only: %i[edit show update destroy]
  before_action :filter_name_programming_language, only: :index
  before_action :set_skill_categories_and_programming_languages, only: %i[new create edit]

  def index
    @frameworks_all = Framework.all
    @frameworks = if params[:programming_language_name].present?
                    Framework.search_framework(@programming_language.first.id)
                  else
                    Framework.all
                  end
    @pagy, @frameworks = pagy(@frameworks.order(id: :ASC), items: per_page)
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

  def filter_name_programming_language
    @name = params[:programming_language_name]
    @programming_language = ProgrammingLanguage.filter_name_programming_languages(@name)
  end

  def framework_params
    params.require(:framework).permit(:name, :programming_language_id, :year_of_release, :latest_version, :skill_category_id)
  end

  def set_skill_categories_and_programming_languages
    @skill_categories = SkillCategory.all.map { |sc| [sc.name, sc.id] }
    @programming_languages = ProgrammingLanguage.all.map { |p| [p.name, p.id] }
  end
end
