require 'spec_helper'


describe "Adding a contact to the do list" do 
	let!(:contact) {create(:contact)}

	it "is successful with valid content" do
		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		fill_in "contact_first_name", with: "Ben"
		fill_in "contact_phone_number", with: "833-88755-888"
		click_button "Create Contact"
		expect(page).to have_content("Contact has been successfully added")
	end

	it "is successful with valid content" do
		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		fill_in "contact_first_name", with: "Ben"
		fill_in "contact_phone_number", with: "833-88755-888"
		click_button "Create Contact"
		expect(page).to have_content("Contact has been successfully added")
	end

	it "is unsuccessful without content" do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("You must enter a First Name and Email or Phone Number")

	end

	it "is unsuccessful with only a first name" do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		fill_in "contact_first_name", with: "Ben"
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter an Email or Phone Number")

	end


	it "is unsuccessful with a bad email " do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		fill_in "contact_first_name", with: "Ben"
		fill_in "contact_email", with: "not$real"
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a valid email")

	end

	it "is unsuccessful with strange characters in the phone number " do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		fill_in "contact_first_name", with: "Ben"
		fill_in "contact_phone_number", with: "555$999"
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter the phone number without non-standard characters ")

	end

end
