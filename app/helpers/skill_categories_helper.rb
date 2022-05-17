module SkillCategoriesHelper
  def load_skill_categories_group
    SkillCategoryGroup.all.map { |skg| [skg.name, skg.id] }
  end
end
