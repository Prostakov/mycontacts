class ContactsController < ApplicationController
  respond_to :json

  def index
  	if user_signed_in?
   	  respond_with current_user.contacts
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def show
  	contact = Contact.find(params[:id])
  	if user_signed_in? && current_user == contact.user
   	  respond_with contact
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def create
  	if user_signed_in?
   	  respond_with current_user.contacts.create(params[:contact])
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def update
  	contact = Contact.find(params[:id])
  	if user_signed_in? && current_user == contact.user
   	  respond_with contact.update(params[:contact])
   	else
   	  respond_with "Permission denied!"
   	end
  end

  def destroy
  	contact = Contact.find(params[:id])
  	if user_signed_in? && current_user == contact.user
   	  respond_with contact.destroy
   	else
   	  respond_with "Permission denied!"
   	end
  end
end
