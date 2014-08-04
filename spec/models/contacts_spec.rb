require 'spec_helper'


describe Contact do
 
	 before do
	 	@contact = Contact.new
	 end

  it "should not save without content" do 
  	 
  	@contact = Contact.new
  	expect(@contact.save).to eq(false)

  end

  it "should save with a first name, last name  and email" do 
   
  	@contact.first_name = "Fake"
    @contact.last_name = "FakeLname"
  	@contact.email = "fake@email.com"
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
  	@contact.first_name = "Ben"
    @contact.last_name = "FakeLname"
  	@contact.middle_name = forty_a
  	expect(@contact.save).to eq(false)
  end


  it "should not save a middle name over 35 characters" do 
    forty_a = "e" * 40
    @contact.first_name = "Ben"
    @contact.last_name = "FakeLname"
    @contact.middle_name = forty_a
    expect(@contact.save).to eq(false)
  end

 it "does not save duplicate email" do 
    @contact.first_name = "Fake"
    @contact.last_name = "FakeLname"
    @contact.email = "fake@email.com"
    expect(@contact.save).to eq(true)

    duplicateemail = Contact.new :first_name => "Fake", :last_name =>"FakeLname", :email => "fake@email.com"
    expect(duplicateemail.save).to eq(false)
  end






end
