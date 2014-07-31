require 'spec_helper'


describe "Adding a contact to the do list" do 
	let!(:contact) {create(:contact)}

	it "is successful with valid content" do
		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("Contact has been successfuly added")
		fill_in "First name", with: "Ben"
		fill_in "Phone number", with: "833-88755-888"
		click_button "Create Contact"
		expect(page).to have_content("Contact has been successfuly added")

	end


end
