# frozen_string_literal: true

module Developers
  class DeveloperProgrammingLanguagesController < BaseController
    def add
    end



    private

    def set_params_developer_programming_laguage
      params.require(:developer).permit(developer_programming_languages_attributes: %i[id programming_language_id level _destroy])
    end
  end
end
