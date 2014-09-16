class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def mew
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    redirect_to @contact, notice: 'Contact was successfully updated.'


  end

  def update
    @contact
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  def new
    @contact = Contact.new
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params[:contact][:email]
    params[:contact][:name]
    params[:contact][:notes]
    params.require(:contact).permit(:name, :email, :notes)
  end
end
