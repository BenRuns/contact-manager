require 'spec_helper'


describe Contact do
 
	 before do
	 	@contact = Contact.new
    @valid_attributes = { :first_name => "Fake",
   :last_name => "FakeLname", :email => "fake@email.com"}
	 end

  it "should not save without content" do 
  	 
  	@contact = Contact.new
  	expect(@contact.save).to eq(false)

  end

  it "should save with a first name, last name  and email" do 
   
  	@contact.update_attributes(@valid_attributes)
  	expect(@contact.save).to eq(true)
  end



  it "should not save with an invalid email " do 
  	 
  	@contact.first_name = "Fake"
    @contact.last_name = "FakeLname"
  	@contact.email = "6765443333"

  	expect(@contact.save).to eq(false)
  end

  it "should save with a valid email " do 

  	@contact.first_name = "Fake"
    @contact.last_name = "FakeLname"
  	@contact.email = "fake@email.com"
  	expect(@contact.save).to eq(true)

  end


  it "should not save a first name over 35 characters" do 
  	forty_a = "a" * 40
  	@contact.first_name = forty_a
    @contact.last_name = "FakeLname"
  	expect(@contact.save).to eq(false)
  end

  it "should not save a first name under 2 characters" do 
     
    @contact.first_name = "a"
    @contact.last_name = "FakeLname"
    expect(@contact.save).to eq(false)
  end

  it "should not save a last name over 35 characters" do 
  	forty_a = "d" * 40
  	@contact.first_name = "Ben"
  	@contact.last_name = forty_a
  	expect(@contact.save).to eq(false)
  end

  it "should not save a last name over 2 characters" do 
    @contact.first_name = "Ben"
    @contact.last_name = "s"
    expect(@contact.save).to eq(false)
  end

  it "should not save a middle name over 35 characters" do 
  	forty_a = "e" * 40
    @contact.update_attributes(@valid_attributes) 
  	@contact.middle_name = forty_a
  	expect(@contact.save).to eq(false)
  end


  it "should not save with an email over 256 characters" do 
    two_fifty_8 = ("e" * 50) +"@" + ("b" * 208) +".com"
    @contact.update_attributes(@valid_attributes) 
    @contact.email = two_fifty_8
    expect(@contact.save).to eq(false)
  end



 it "does not save duplicate email" do 
    @contact.update_attributes(@valid_attributes) 
    expect(@contact.save).to eq(true)

    duplicateemail = Contact.new :first_name => "Fake", :last_name =>"FakeLname", :email => "fake@email.com"
    expect(duplicateemail.save).to eq(false)
  end
  
  it "should not save with an address over 256 characters" do 
    two_fifty_8 = ("e" * 50) +"@" + ("b" * 208) +".com"
    @contact.update_attributes(@valid_attributes) 
    @contact.email = two_fifty_8
    expect(@contact.save).to eq(false)
  end

  it "should not save with an state over 40 characters" do 
    fifty_e = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.state = fifty_e
    expect(@contact.save).to eq(false)
  end

  it "should not save with an city over 40 characters" do 
    fifty_e = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.city = fifty_e
    expect(@contact.save).to eq(false)
  end

  it "should not save with an postal over 20 characters" do 
    twenty_e = ("e" * 21) 
    @contact.update_attributes(@valid_attributes)  
    @contact.postal_code = twenty_e
    expect(@contact.save).to eq(false)
  end

  it "should not save with an country over 40 characters" do 
    fifty_e = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.country = fifty_e
    expect(@contact.save).to eq(false)
  end
#   #TODO

  it "should not save with an phone over 20 characters" do 
    twenty_e = ("e" * 21) 
    @contact.update_attributes(@valid_attributes)  
    @contact.phone_number = twenty_e
    expect(@contact.save).to eq(false)
  end

  it "should validate  a US zip code format when country is the US" do      
    @contact.update_attributes(@valid_attributes)  
    @contact.country = "USA"
    @contact.postal_code = "12345"
    expect(@contact.save).to eq(true)
  end
  it "should reject a wrong US zip code format when country is the US" do      
    @contact.update_attributes(@valid_attributes)  
    @contact.country = "USA"
    @contact.postal_code = "12345XYZ"
    expect(@contact.save).to eq(false)
  end


  it "should validate a US zip code format when country is the US" do      
    @contact.update_attributes(@valid_attributes)  
    @contact.country = "US"
    @contact.postal_code = "12345-1234"
    expect(@contact.save).to eq(true)
  end

  it "accepts a US phone format when country is the US" do      
    @contact.update_attributes(@valid_attributes)  
    @contact.country = "US"
    @contact.phone_number = "123-455-1234"
    expect(@contact.save).to eq(true)
  end

  it "rejects a non-US phone format when country is the US" do      
    @contact.update_attributes(@valid_attributes)  
    @contact.country = "US"
    @contact.phone_number = "44444123-455-1234"
    expect(@contact.save).to eq(false)
  end





end
