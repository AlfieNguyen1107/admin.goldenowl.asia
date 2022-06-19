# frozen_string_literal: true

module Developers
  class ProgrammingLanguagesController < BaseController
    before_action :set_programming_language, only: %i[delete]

    def add
      render :add
    end

    def create
      programming_language_params.each do |programming_language|
        DeveloperProgrammingLanguage.find_or_create_by(programming_language_id: programming_language[:programming_language_id],
                                                       developer_id: @developer.id,
                                                       level: programming_language[:level])
      end
      render :update_list_programming_languages
    end

    def delete
      @programming_language.destroy
      render :update_list_programming_languages
    end

    private

    def set_programming_language
      @programming_language = DeveloperProgrammingLanguage.find(params[:id])
    end

    def programming_language_params
      params.require(:developer)[:programming_languages]
    end
  end
end
