class ContactsController < ApplicationController

	def index

		if params[:order] == "first_name" || params[:order] == "last_name" || params[:order] == "email" || params[:order] == "phone_number" || params[:order] == "city"
		
		order = params[:order]
		
		else
		
		order = "first_name"
		end


		@contacts = Contact.order(order).paginate(:page => params[:page], :per_page => 25)
		

		
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
			
			flash[:success] = "Contact has been successfully added"
			redirect_to "/contacts"
		else
			flash[:error] = "There was a problem adding the contact." +
							" " + @contact.errors.full_messages.join(', ')

			render 'new'
		end		
	end

	def update
		@contact = Contact.find_by_id(params[:id])
		@contact.update_attributes(contact_params)
		
	

		if @contact.save 
			
			flash[:success] = "Contact has been successfully updated"
			redirect_to "/contacts"
		else
			flash[:error] = "There was a problem adding the contact." +
							" " + @contact.errors.full_messages.join(', ')

			render 'edit'
		end		

	end
	def destroy
		@contact = Contact.find_by_id(params[:id])
		@contact.delete
		flash[:success] = "Contact has been successfully deleted"
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
			@contacts = Contact.where( a ).paginate(:page => params[:page], :per_page => 25)
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
