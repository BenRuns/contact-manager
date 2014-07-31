require 'spec_helper'


describe Contact do
 
	 before do
	 	@contact = Contact.new
	 end

  it "should not save without content" do 
  	 
  	@contact = Contact.new
  	expect(@contact.save).to eq(false)

  end

  it "should save with a first name and number " do 
   
  	@contact.first_name = "Fake"
  	@contact.phone_number = "6765443333"
  	expect(@contact.save).to eq(true)
  end

  it "should not save an invalid email" do 
  	 
  	@contact.first_name = "Fake"
  	@contact.email = "6765443333"
  	expect(@contact.save).to eq(false)
  end

  it "should save  a valid email" do 
  	@contact.first_name = "Fake"
  	@contact.email = "fake@email.com"
  	expect(@contact.save).to eq(true)

  end


  it "should not save a first name over 35 characters" do 
  	forty_a = "a" * 40
  	@contact.first_name = forty_a
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
  	@contact.middle_name = forty_a
  	expect(@contact.save).to eq(false)
  end






end
