require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe "POST create" do 
  	it "can be created with only first_name and phone number " do 
  		post :create, {:first_name => "ben", :phone_number => "763-6655"}

  		(Contact.last.first_name).must_equal("ben")
  	end
    it "can be created with only first_name and email " do 
      post :create, {:first_name => "ben", :phone_number => "763-6655"}
  
      (Contact.last.first_name).must_equal("ben")
    end
  		


  
  end


end