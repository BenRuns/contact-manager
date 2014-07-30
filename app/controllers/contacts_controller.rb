class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
		render 'index'

	end
	def edit
		@contact = Contact.find_by_id(params[:id])
		render 'edit'
	
	end


	def create
		@contact = Contact.create(contact_params)
		redirect_to "/contacts"

	end

	def update
		@contact = Contact.find_by_id(params[:id])
		@contact.update_attributes(contact_params)
		
		redirect_to contact_path(@contact)

	end
	def destroy
		@contact = Contact.find_by_id(params[:id])
		@contact.delete
		redirect_to "/"
	end

	private

  	def contact_params
    	params.require(:contact).permit(:first_name, :email, :password, :last_name, :phone_number, :address, :middle_name )
  	end


end
