class ContactsController < ApplicationController
  def index
    @contacts = Contact.find(params[:user_id])
    @shared_contacts = ContactShare.find(params[:user_id])
    render json: @contacts + @shared_contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update!(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    destroyed_contact = @contact.destroy
    render json: destroyed_contact
  end

private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
