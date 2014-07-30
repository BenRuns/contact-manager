require 'spec_helper'

 
  #let(:contact) { Contact.create(:first_name => "ben", :phone_number => "763-6655", :id => 1) }
describe ContactsController do

  describe "POST create" do 

  	let(:contact) { Contact.create(:first_name => "ben", :phone_number => "763-6655", :id => 1) }

  	it "can be created with only first_name and phone number " do 
  		post :create,:contact=> {:first_name => "ben", :phone_number => "763-6655"}

  		expect(Contact.last.first_name).to eq("ben")

  	end
    
    it "can be created with only first_name and email" do 
      post :create, :contact=> {:first_name => "ben", :email => "fake@email"}
  
      expect(Contact.last.first_name).to eq("ben")
    end

    it "can't be created with out a first_name  " do 
      post :create, :contact=> { :phone_number => "763-6655", :id => 2}

      expect(Contact.find_by_id(2)).to eq(nil)

    


  
  end
  describe "POST update" do 
    it "changes attributes of the first_name " do 
      expect(Contact.find_by_id(contact.id).first_name).to eq("ben")
      put :update,:id => contact.id , :contact => {:first_name => "Jack"}
      expect(Contact.find_by_id(contact.id).first_name).to eq("Jack")
    end
  end

  describe "DELETE destroy" do
    it "deletes a contact" do 
      expect(Contact.find_by_id(contact.id)).to eq(contact)
      put :destroy ,:id => contact.id 
     expect(Contact.find_by_id(contact.id)).to eq(nil)
    end

  end
  # describe "GET index" do 
  #   it "returns a  contact"

  describe "GET index" do 
    it "returns a list of contacts by first_name" do
      get :index, :contact => { :first_name => 'ben' }
      assigns(:contacts).to eq([contact])
    end
  end

  describe "GET edit" do 
  	it "renders the edit template" do 
  		get :edit, :id => contact.id 

  		response.should render_template("edit")
  	end

    it "edits the correct user" do 
      get :edit, :id => contact.id 

      expect(assigns(:contact)).to eq(contact)
    end
  end	
end






end