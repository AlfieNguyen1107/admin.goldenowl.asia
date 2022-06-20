class SkillCategoriesController < ApplicationController
  before_action :load_skill_category, only: %i[show edit destroy update]
  before_action :set_new_skill_category, only: %i[new create]
  before_action :set_skill_category_collection, only: %i[index]

  def index
    @skill_categories_group_name = SkillCategoryGroup.joins(:skill_categories).pluck(:name).uniq
    group_name = params[:skill_category_group_name]
    if group_name.present?
      skill_category_group = SkillCategoryGroup.find_by(name: group_name)
      @skill_categories = skill_category_group.skill_categories
    end
    @pagy, @skill_categories = pagy(@skill_categories, items: per_page)
  end

  def new; end

  def create
    if @skill_category.save
      redirect_to @skill_category, notice: 'Skill category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @skill_category.update(skill_category_params)
      redirect_to @skill_category, notice: 'Skill category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill_category.destroy
    redirect_to skill_categories_path, notice: 'Skill category was successfully destroyed.'
  end

  private

  def load_skill_category
    @skill_category = SkillCategory.find(params[:id])
    authorize(@skill_category)
  end

  def skill_category_params
    params.require(:skill_category).permit(:name, :order, :skill_category_group_id)
  end

  def set_new_skill_category
    @skill_category = SkillCategory.new((request.post? && skill_category_params) || nil)
    authorize(@skill_category)
  end

  def set_skill_category_collection
    @skill_categories = SkillCategory.order(id: :asc)
    authorize(@skill_categories)
  end
end
