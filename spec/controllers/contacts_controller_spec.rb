require 'spec_helper'

 
  #let(:contact) { Contact.create(:first_name => "ben", :phone_number => "763-6655", :id => 1) }
describe ContactsController do
  let(:contact) { create(:contact) }


  describe "POST create" do 

  	it "can't be created with only first_name and phone number " do 
  		post :create,:contact=> {:first_name => "ben", :phone_number => "763-6655", :id => 2}
  		expect(Contact.find_by_id(2)).to eq(nil)
  	end
    
    it "can be created with only first_name, last_name and email" do 
      post :create, :contact=> {:first_name => "ben",:last_name => "There", :email => "fake@email.com"}
      expect(Contact.find_by_email("fake@email.com").first_name).to eq("ben")
    end

    it "can't be created with out a first_name  " do 
      post :create, :contact=> { :phone_number => "763-6655" }
      expect(Contact.find_by_phone_number("763-6655")).to eq(nil)
    end
    it "saves two letter state codes" do 
      post :create, :contact=> {:first_name => "ben",:last_name => "There", :email => "fake@email.com", :state => "OR",:id => 2}
      expect(Contact.find_by_last_name("There").state).to eq("OR")
    end

    it "should not save a duplicate email" do
      contact.first_name = "Firstversion"
      contact.email = "copy@one.com"
      contact.save
      post :create, :contact=> {:first_name => "Secondversion",:last_name => "There", :email => "copy@one.com", :state => "OR",:id => 2}
      expect(Contact.find_by_first_name("Firstversion").email).to eq("copy@one.com")
      expect(Contact.find_by_first_name("Secondversion")).to eq(nil)
    end
  end


  describe "POST update" do 
    it "changes attributes of the first_name " do 
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
  

  describe "GET find" do 
    it "returns a list of contacts by first_name" do
      10.times { |x| create(:contact) }
      contact.first_name = "ben"
      get :find , :contact => { :first_name => 'ben' }
      response.should render_template("index")
      expect(assigns(:contacts).all? {|x| x.first_name == 'ben'}).to eq(true) 
    end

    it "renders the index page " do
      get :find , :contact => { :first_name => 'ben' }
      response.should render_template("index")
    end
  end

  describe "GET show" do 
    it "renders the show template" do
      get :show, :id => contact.id 
      response.should render_template("show")
    end

    it "renders the contact by id" do 
      get :show, :id => contact.id 
      expect(assigns(:contact)).to eq(contact)
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

  describe "GET new" do 
    it "renders the new template" do 
      get :new, :id => contact.id 

      response.should render_template("new")
    end
  end 

end





