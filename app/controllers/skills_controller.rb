# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :load_skill, only: %i[show edit destroy update]
  before_action :load_skill_categories, only: %i[edit new]
  before_action :set_new_skill, only: %i[new create]
  before_action :set_skill_collection, only: %i[index]

  def index
    @skill_categories_name = SkillCategory.joins(:skills).pluck(:name).uniq
    category_name = params[:skill_category_name]
    if category_name.present?
      skill_category = SkillCategory.find_by(name: category_name)
      @skills = skill_category.skills
    end
    @pagy, @skills = pagy(@skills, items: per_page)
  end

  def new; end

  def create
    if @skill.save
      redirect_to @skill, notice: 'Skill was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @skill.update(skill_params)
      redirect_to @skill, notice: 'Skill was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path, notice: 'Skill was successfully destroyed.'
  end

  private

  def load_skill
    @skill = Skill.find(params[:id])
    authorize(@skill)
  end

  def skill_params
    params.require(:skill).permit(:name, :order, :skill_category_id)
  end

  def load_skill_categories
    @skill_categories = SkillCategory.all.map { |sc| [sc.name, sc.id] }
  end

  def set_new_skill
    @skill = Skill.new((request.post? && skill_params) || nil)
    authorize(@skill)
  end

  def set_skill_collection
    @skills = Skill.order(id: :asc)
    authorize(@skills)
  end
end
