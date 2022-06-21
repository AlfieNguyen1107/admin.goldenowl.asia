class CertificatesController < ApplicationController
  before_action :set_certificate, only: %i[show edit update destroy]
  before_action :set_new_certificate, only: %i[new create]

  def index
    @certificates = Certificate.all
    @pagy, @certificates = pagy(@certificates.order(id: :ASC), items: per_page)
  end

  def create
    if @certificate.save
      redirect_to certificates_path, notice: 'Certificate was successfully created'
    else
      redirect_to certificates_path, notice: 'Certificate was unsuccessfully created'
    end
  end

  def show; end

  def edit; end

  def new; end

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
    authorize(@certificate)
  end

  def certificate_params
    params.require(:certificate).permit(:name, :rating)
  end

  def set_new_certificate
    @certificate = Certificate.new((request.post? && certificate_params) || nil)
    authorize(@certificate)
  end
end
