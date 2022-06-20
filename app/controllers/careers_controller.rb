class CareersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_career, only: %i[show edit update destroy]
  before_action :set_new_career, only: %i[new create]

  def index
    @pagy, @careers = pagy(extract_career, items: per_page)
  end

  def new; end

  def edit; end

  def show; end

  def create
    if @career.save
      redirect_to @career, notice: 'Career was successfully created.'
    else
      render :new
    end
  end

  def update
    if @career.update(career_params)
      redirect_to @career, notice: 'Career was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @career.destroy
    redirect_to careers_url, notice: 'Career was successfully deleted.'
  end

  private

  def set_career
    @career = Career.friendly.find(params[:id])
    authorize(@career)
  end

  def career_params
    params.require(:career).permit(:title, :content, :job_type, :status, :image)
  end

  def extract_career
    @careers = if params[:search]
                 Career.search(params[:search])
               else
                 Career.all.order(id: :desc)
               end
    authorize(@careers)
  end

  def set_new_career
    @career = Career.new((request.post? && career_params) || nil)
    authorize(@career)
  end
end
