class ContactsController < ApplicationController

	def index
		@contacts = Contact.order('first_name')
		render 'index'

	end

	def edit
		@contact = Contact.find_by_id(params[:id])
		render 'edit'
	
	end

	def new
		@contact = Contact.new
	end


	def create
		@contact = Contact.create(contact_params)

		if @contact.save 
			
			flash[:success] = "Contact has been successfuly added"
			redirect_to "/contacts"
		else
			flash[:error] = "There was a problem adding the contact"
			render 'new'
		end		
	end

	def update
		@contact = Contact.find_by_id(params[:id])
		@contact.update_attributes(contact_params)
		
		redirect_to contact_path(@contact)

	end
	def destroy
		@contact = Contact.find_by_id(params[:id])
		@contact.delete
		redirect_to contacts_path
	end

	def show 
		@contact = Contact.find_by_id(params[:id])
	end

	def find
		if params[:contact].nil?
			render 'search'
		
		else
			a = contact_params.delete_if { |x,y| y.empty? }
			#b = a.collect { |x,y| "#{x}='#{y}'" if !y.nil? }
			#c =  ActiveRecord::Base::sanitize_sql_for_conditions(a)
			@contacts = Contact.where( a )
			render 'index'
		end


	end

	private

  	def contact_params
    	params.require(:contact).permit(:first_name, :email, :password, 
    									:last_name, :phone_number,
    									 :street_address, :middle_name,
    									 :country, :state, :postal_code )
  	end


end
