class SkillCategoryGroupsController < ApplicationController
  before_action :set_skill_category_group, only: %i[show edit update destroy]
  before_action :set_new_skill_category_group, only: %i[new create]
  before_action :set_skill_category_group_collection, only: %i[index]

  def index
    @pagy, @skill_category_groups = pagy(@skill_category_groups, item: per_page)
  end

  def create
    if @skill_category_group.save
      redirect_to @skill_category_group, notice: 'Skill category group was successfully created.'
    else
      render :new
    end
  end

  def show;  end

  def edit;  end

  def new; end

  def update
    if @skill_category_group.update(skill_category_group_params)
      redirect_to @skill_category_group, notice: 'Skill category group was successfully updtated.'
    else
      render :new
    end
  end

  def destroy
    @skill_category_group.destroy
    redirect_to skill_category_groups_path, notice: 'Skill category group was successfully destroyed.'
  end

  private

  def skill_category_group_params
    params.require(:skill_category_group).permit(:name, :order)
  end

  def set_skill_category_group
    @skill_category_group = SkillCategoryGroup.find(params[:id])
    authorize(@skill_category_group)
  end

  def set_new_skill_category_group
    @skill_category_group = SkillCategoryGroup.new((request.post? && skill_category_group_params) || nil)
    authorize(@skill_category_group)
  end

  def set_skill_category_group_collection
    @skill_category_groups = SkillCategoryGroup.order(id: :asc)
    authorize(@skill_category_groups)
  end
end
