class SkillCategoryGroupsController < ApplicationController
  before_action :set_skill_category_group, only: %i[show edit update destroy]

  def index
    @skill_category_groups = SkillCategoryGroup.all
    @pagy, @skill_category_groups = pagy(@skill_category_groups, item: per_page)
  end

  def create
    @skill_category_group = SkillCategoryGroup.new(skill_categoty_group_params)
    respond_to do |format|
      if @skill_category_group.save
        format.html { redirect_to @skill_category_group, notice: 'Skill category group was successfully created.' }
        format.json { render :show, status: :created, location: @skill_category_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill_category_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def show;  end

  def edit;  end

  def new
    @skill_category_group = SkillCategoryGroup.new
  end

  def update
    respond_to do |format|
      if @skill_category_group.update(skill_categoty_group_params)
        format.html { redirect_to @skill_category_group, notice: 'Skill category group was successfully updtated.' }
        format.json { render :show, status: :created, location: @skill_category_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill_category_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill_category_group.destroy
    redirect_to skill_category_groups_path, notice: 'Skill category group was successfully destroyed.'
  end

  private

  def skill_categoty_group_params
    params.require(:skill_category_group).permit(:name, :order)
  end

  def set_skill_category_group
    @skill_category_group = SkillCategoryGroup.find(params[:id])
  end
end
