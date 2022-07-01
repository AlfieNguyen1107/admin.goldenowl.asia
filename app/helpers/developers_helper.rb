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

  def tool_name(employee)
    employee.employee_tools.map { |employee_tool| employee_tool.tool.name }.join(', ')
  end

  def programming_language_name(developer)
    developer.developer_programming_languages.map { |developer_programming_language| developer_programming_language.programming_language.name }.join(', ')
  end

  def certificate_name(developer)
    developer.certificate_employees.map { |certificate_employee| certificate_employee.certificate.name }.join(', ')
  end

  def framework_name(developer)
    developer.developer_frameworks.map { |developer_framework| developer_framework.framework.name }.join(', ')
  end
end
