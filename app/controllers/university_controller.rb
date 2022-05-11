class UniversityController < ApplicationController
  before_action :set_university, only: %i[show edit destroy update]

  def index
    @universities_all = University.all
    if params[:code].present?
      @code = params[:code]
      @universities = University.where('code = ?', params[:code])
    else
      @universities = University.all
    end
    @pagy, @universities = pagy(@universities.order(id: :ASC), items: per_page)
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def new
    @university = University.new
  end

  def edit; end

  def destroy
    if @university.destroy
      redirect_to university_index_path, notice: 'University was successfully destroyed.'
    else
      redirect_to university_index_path, notice: 'University was unsuccessfully destroyed.'
    end
  end

  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_university
    @university = University.find(params[:id])
  end

  def university_params
    params.require(:university).permit(:code, :name)
  end
end
