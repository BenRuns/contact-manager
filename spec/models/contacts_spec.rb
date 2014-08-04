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

  it "should not save a last name over 35 characters" do 
  	forty_a = "d" * 40
  	@contact.first_name = "Ben"
  	@contact.last_name = forty_a
  	expect(@contact.save).to eq(false)
  end

  it "should not save a middle name over 35 characters" do 
  	forty_a = "e" * 40
    @contact.update_attributes(@valid_attributes) 
  	@contact.middle_name = forty_a
  	expect(@contact.save).to eq(false)
  end


  it "should not save with an email over 256 characters" do 
    TwoFifty8 = ("e" * 50) +"@" + ("b" * 208) +".com"
    @contact.update_attributes(@valid_attributes) 
    @contact.email = TwoFifty8
    expect(@contact.save).to eq(false)
  end



 it "does not save duplicate email" do 
    @contact.update_attributes(@valid_attributes) 
    expect(@contact.save).to eq(true)

    duplicateemail = Contact.new :first_name => "Fake", :last_name =>"FakeLname", :email => "fake@email.com"
    expect(duplicateemail.save).to eq(false)
  end
  
  it "should not save with an address over 256 characters" do 
    TwoFifty8 = ("e" * 50) +"@" + ("b" * 208) +".com"
    @contact.update_attributes(@valid_attributes) 
    @contact.email = TwoFifty8
    expect(@contact.save).to eq(false)
  end

  it "should not save with an state over 40 characters" do 
    Fifty_E = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.state = Fifty_E
    expect(@contact.save).to eq(false)
  end

  it "should not save with an city over 40 characters" do 
    Fifty_E = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.city = Fifty_E
    expect(@contact.save).to eq(false)
  end

  it "should not save with an postal over 20 characters" do 
    Twenty_E = ("e" * 21) 
    @contact.update_attributes(@valid_attributes)  
    @contact.postal_code = Twenty_E
    expect(@contact.save).to eq(false)
  end

  it "should not save with an country over 40 characters" do 
    Fifty_E = ("e" * 50) 
    @contact.update_attributes(@valid_attributes)  
    @contact.country = Fifty_E
    expect(@contact.save).to eq(false)
  end
#   #TODO
#   it "should not save with an phone over 256 characters" do 
#     TwoFifty8 = ("e" * 50) +"@" + ("b" * 208) +".com"
#     @contact.first_name = "Ben"
#     @contact.last_name = "FakeLname"
#     @contact.email = TwoFifty8
#     expect(@contact.save).to eq(false)
#   end








end
