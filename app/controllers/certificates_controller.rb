class CertificatesController < ApplicationController
  before_action :set_certificate, only: %i[show edit update destroy]

  def index
    @certificate_all = Certificate.all
    if params[:name].present?
      @name = params[:name]
      @certificates = Certificate.filter_name_certificate(@name)
    else
      @certificates = Certificate.all
    end 
    @pagy, @certificates = pagy(@certificates.order(id: :ASC), items: per_page)
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to certificates_path, notice: 'Certificate was successfully created'
    else
      redirect_to certificates_path, notice: 'Certificate was unsuccessfully created'
    end
  end

  def show; end

  def edit; end
  
  def new
    @certificate = Certificate.new
  end

  def update
    if @certificate.update(certificate_params)
      redirect_to certificate_path, notice: 'Certificate was successfully updated'
    else
      redirect_to certificates_path, notice: 'Certificate was unsuccessfully updated'
    end
  end

  def destroy
    if @certificate.destroy
      redirect_to certificates_path, notice: 'Certificate was successfully destroyed'
    else
      redirect_to certificates_path, notice: 'Certificate was unsuccessfully destroyed'
    end
  end

  private

  def set_certificate
    @certificate = Certificate.find(params[:id])
  end

  def certificate_params
    params.require(:certificate).permit(:name, :rating)
  end
end
