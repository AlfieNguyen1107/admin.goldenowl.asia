module ToolsHelper
  def skill_category_collection
    SkillCategory.pluck(:name, :id)
  end
end
