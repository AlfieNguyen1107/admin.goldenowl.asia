class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[show edit destroy update]
  before_action :set_new_university, only: %i[new create]

  def index
    @universities_all = University.all
    if params[:code].present?
      @code = params[:code]
      @universities = University.filter_code_universities(@code)
    else
      @universities = University.all
    end
    @pagy, @universities = pagy(@universities.order(id: :ASC), items: per_page)
  end

  def create
    if @university.save
      redirect_to @university, notice: 'University was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def new; end

  def edit; end

  def destroy
    @university.destroy
    redirect_to universities_path, notice: 'University was successfully destroyed.'
  end

  def update
    if @university.update(university_params)
      redirect_to @university, notice: 'University was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_university
    @university = University.find(params[:id])
    authorize(@university)
  end

  def university_params
    params.require(:university).permit(:code, :name)
  end

  def set_new_university
    @university = University.new((request.post? && university_params) || nil)
    authorize(@university)
  end
end
