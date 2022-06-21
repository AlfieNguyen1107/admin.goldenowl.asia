class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]
  before_action :set_contact, only: %i[new edit create]
  before_action :set_new_client, only: %i[new create]

  def index
    @pagy, @clients = pagy(extract_client, items: per_page)
  end

  def show
    @location_address = Geocoder.search(@client.address)
    @pagy, @projects = pagy(@client.projects, items: per_page)
  end

  def new; end

  def edit; end

  def create
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private

  def set_client
    @client = Client.find(params[:id])
    authorize(@client)
  end

  def client_params
    params.require(:client).permit(:name, :address, :hq, :contactable_id).merge(contactable_type: 'Contact')
  end

  def extract_client
    @clients = if params[:search]
                 Client.search(params[:search])
               else
                 Client.order(id: :desc)
               end
    authorize(@clients)
  end

  def set_contact
    @contact = Contact.all.map { |e| [e.full_name, e.id] }
  end

  def set_new_client
    @client = Client.new((request.post? && client_params) || nil)
    authorize(@client)
  end
end
