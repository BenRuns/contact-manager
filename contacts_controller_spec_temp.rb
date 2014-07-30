require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  let!(:contact) { Contact.create(:first_name => "ben", :phone_number => "763-6655", :id => 1) }

  describe "POST create" do 
  	it "can be created with only first_name and phone number " do 
  		post :create,:contact=> {:first_name => "ben", :phone_number => "763-6655"}

  		expect(Contact.last.first_name).to _equal("ben")

  	end
    
    it "can be created with only first_name and email" do 
      post :create, :contact=> {:first_name => "ben", :email => "fake@email"}
  
      (Contact.last.first_name).must_equal("ben")
    end

    it "can't be created with out a first_name  " do 
      post :create, :contact=> { :phone_number => "763-6655", :id => 2}

      (Contact.find_by_id(2)).must_be_nil

    e


  
  end
  describe "POST update" do 
    it "changes attributes of the first_name " do 
      (Contact.find_by_id(contact.id).first_name).must_equal("ben")
      put :update,:id => contact.id , :contact => {:first_name => "Jack"}
      (Contact.find_by_id(contact.id).first_name).must_equal("Jack")
    end
  end

  describe "DELETE destroy" do
    it "deletes a contact" do 
      (Contact.find_by_id(contact.id)).must_equal(contact)
      put :destroy ,:id => contact.id 
     (Contact.find_by_id(contact.id)).must_be_nil 
    end

  end
  # describe "GET index" do 
  #   it "returns a  contact"

  describe "GET index" do 
    it "returns a list of contacts by first_name" do
      get :index, :contact => { :first_name => 'ben' }
      assigns(:contacts).must_equal([contact])
    end
  end





end