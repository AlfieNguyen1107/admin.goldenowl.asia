module FrameworksHelper
  def name_programming_language
    ProgrammingLanguage.pluck(:name, :id)
  end
end
