class ProgrammingLanguageController < ApplicationController
  before_action :set_programming_language, only: %i[show edit update destroy]
  
  def index
    @programming_languages_all = ProgrammingLanguage.all

    if params[:name].present?
      @name = params[:name]
      @programming_languages = ProgrammingLanguage.where('name = ?', params[:name])
    else
      @programming_languages = ProgrammingLanguage.all
    end
    @pagy, @programming_languages = pagy(@programming_languages.order(id: :ASC) , items: per_page)
  end

  def create
    @programming_language = ProgrammingLanguage.new(programming_language_params)
    respond_to do |format|
        if @programming_language.save
          format.html { redirect_to @programming_language, notice: 'Programming langguage was successfully created.' }
          format.json { render :show, status: :created, location: @programming_language }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @programming_language.errors, status: :unprocessable_entity }
        end
      end
  end

  def show 
  end
  
  def edit   
  end

  def update
    respond_to do |format|
        if @programming_language.update(programming_language_params)
          format.html { redirect_to @programming_language, notice: 'Programming Language was successfully updated.' }
          format.json { render :show, status: :ok, location: @programming_language }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @programming_language.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    if @programming_language.destroy
      redirect_to programming_language_index_path, notice: 'Programming Language was successfully destroyed.' 
    else
      redirect_to programming_language_index_path, notice: 'Programming Language was unsuccessfully destroyed.' 
    end
  end

  private 
  def set_programming_language
    @programming_language = ProgrammingLanguage.find(params[:id])
  end

  def programming_language_params
    params.require(:programming_language).permit(:name, :year_of_release, :latest_version)
  end
end
