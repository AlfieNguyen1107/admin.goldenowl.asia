class SkillsController < ApplicationController
  before_action :load_skill, only: %i[show edit destroy update]
  before_action :load_skill_categories, only: %i[edit new]

  def index
    @skills = Skill.all
    @skill_categories_name = SkillCategory.joins(:skills).pluck(:name).uniq
    category_name = params[:skill_category_name]
    if category_name.present?
      skill_category = SkillCategory.find_by(name: category_name)
      @skills = skill_category.skills
    end
    @pagy, @skills = pagy(@skills.order(id: :ASC), items: per_page)
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_path, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def load_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :order, :skill_category_id)
  end

  def load_skill_categories
    @skill_categories = SkillCategory.all.map { |sc| [sc.name, sc.id] }
  end
end
