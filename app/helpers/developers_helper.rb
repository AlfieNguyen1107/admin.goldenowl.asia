module DevelopersHelper
  def levels_collection
    DeveloperProgrammingLanguage.levels.map { |p| [p[0], p[0]] }
  end

  def projects_collection
    Project.pluck(:name, :id)
  end

  def programming_languages_collection
    ProgrammingLanguage.pluck(:name, :id)
  end

  def frameworks_collection
    Framework.pluck(:name, :id)
  end

  def tools_collection
    Tool.pluck(:name, :id)
  end

  def skills_collection
    Skill.pluck(:name, :id)
  end

  def universities_collection
    University.pluck(:name, :id)
  end

  def companies_collection
    Company.pluck(:name, :id)
  end

  def certificates_collection
    Certificate.pluck(:name, :id)
  end
end
