class ContactsController < ApplicationController

	def create
		@contact = Contact.create(:first_name => params[:first_name], :phone_number => params[:phone_number])
		redirect_to "/contacts"

	end
end
