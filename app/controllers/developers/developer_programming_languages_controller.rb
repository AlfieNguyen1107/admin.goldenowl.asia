# frozen_string_literal: true

module Developers
  class DeveloperProgrammingLanguagesController < BaseController
    def update
      flash[:notice] = "#{@developer.update(set_params_developer_programming_laguage) ? 'Successfully' : 'Unsuccessfully'} update programming language" if params[:developer]
      redirect_to developer_path(@developer)
    end

    private

    def set_params_developer_programming_laguage
      params.require(:developer).permit(developer_programming_languages_attributes: %i[id programming_language_id level _destroy])
    end
  end
end
