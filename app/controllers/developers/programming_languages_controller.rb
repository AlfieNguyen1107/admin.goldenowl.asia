# frozen_string_literal: true

module Developers
  class ProgrammingLanguagesController < BaseController
    before_action :set_programming_language, only: %i[destroy]

    def add
      render :add
    end

    def create
      programming_language_params['programming_languages'].each do |param|
        programming_language = DeveloperProgrammingLanguage.find_or_initialize_by(programming_language_id: param['id'],
                                                                                  developer_id: @developer.id)
        programming_language.update(level: param['level'])
      end
      render :update_list_programming_languages
    end

    def destroy
      @programming_language.destroy
      render :update_list_programming_languages
    end

    private

    def set_programming_language
      @programming_language = DeveloperProgrammingLanguage.find(params[:id])
    end

    def programming_language_params
      params.require(:developer).permit(programming_languages: %i[id level])
    end
  end
end
