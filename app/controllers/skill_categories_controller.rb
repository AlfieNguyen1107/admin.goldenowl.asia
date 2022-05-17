class SkillCategoriesController < ApplicationController
  before_action :load_skill_category, only: %i[show edit destroy update]

  def index
    @skill_categories = SkillCategory.all
    @skill_categories_group_name = SkillCategoryGroup.joins(:skill_categories).pluck(:name).uniq
    group_name = params[:skill_category_group_name]
    if group_name.present?
      skill_category_group = SkillCategoryGroup.find_by(name: group_name)
      @skill_categories = skill_category_group.skill_categories
    end
    @pagy, @skill_categories = pagy(@skill_categories.order(id: :ASC), items: per_page)
  end

  def new
    @skill_category = SkillCategory.new
  end

  def create
    @skill_category = SkillCategory.new(skill_category_params)
    respond_to do |format|
      if @skill_category.save
        format.html { redirect_to @skill_category, notice: 'Skill category was successfully created.' }
        format.json { render :show, status: :created, location: @skill_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def update
    respond_to do |format|
      if @skill_category.update(skill_category_params)
        format.html { redirect_to @skill_category, notice: 'Skill category was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill_category.destroy
    respond_to do |format|
      format.html { redirect_to skill_categories_path, notice: 'Skill category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def load_skill_category
    @skill_category = SkillCategory.find(params[:id])
  end

  def skill_category_params
    params.require(:skill_category).permit(:name, :order, :skill_category_group_id)
  end
end
