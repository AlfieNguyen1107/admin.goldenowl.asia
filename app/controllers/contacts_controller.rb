class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :load_nationalities_countries, only: %i[edit update new create]
  before_action :set_new_contact, only: %i[new create]
  before_action :set_contact_collection, only: %i[index]

  def index
    @pagy, @contacts = pagy(@contacts, items: per_page)
  end

  def show; end

  def new; end

  def edit; end

  def create
    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
    authorize(@contact)
  end

  def contact_params
    params.require(:contact).permit(:full_name, :image, :primary_phone_number, :company_homepage_url, :company_linkedin_url, :personal_linkedin_url, :personal_facebook_url, :personal_twitter_url, :based_nationality, :current_living_country)
  end

  def load_nationalities_countries
    @nationalities = Contact.all.pluck(:based_nationality)
    @countries = Contact.all.pluck(:current_living_country)
  end

  def set_new_contact
    @contact = Contact.new((request.post? && contact_params) || nil)
    authorize(@contact)
  end

  def set_contact_collection
    @contacts = Contact.order(id: :asc)
    authorize(@contacts)
  end
end
