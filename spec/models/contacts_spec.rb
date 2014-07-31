require 'spec_helper'

describe Contact do
  it "should not save without content" do 
  	@contact = Contact.new
  	expect(@contact.save).to eq(false)

  end
  
  it "should save with first name and number " do 
  	@contact = Contact.new
  	@contact.first_name = "Fake"
  	@contact.phone_number = "6765443333"
  	expect(@contact.save).to eq(true)
  end

end
