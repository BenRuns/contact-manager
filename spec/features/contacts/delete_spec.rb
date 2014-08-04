
require 'spec_helper'


feature "User deletes a contact" do
	let!(:contact) {create(:contact)}
	 


	scenario  "user successfully deletes contact " do
		id = contact.id
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{id}") do 
			click_link "Edit"

		end

		expect(page).to have_content("Editing")
		click_link "Delete"
		expect(page).to have_content("Are you sure you want to delete this contact?")
		click_link "Yes"
		expect(page).to have_content("Contact has been successfully deleted")
		expect(page).to not_have_content("#results-entry-#{id}")
	end

	scenario  "user successfully stops from deleting a contact " do
		id = contact.id
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{id}") do 
			click_link "Edit"

		end

		expect(page).to have_content("Editing")
		click_link "Delete"
		expect(page).to have_content("Are you sure you want to delete this contact?")
		click_link "No"
		expect(page).to have_content("Contact has not been deleted")
		expect(page).to have_content("#results-entry-#{id}")
	end

	scenario  "user returns to the home page before deleting contact" do
		id = contact.id
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{id}") do 
			click_link "Edit"

		end

		expect(page).to have_content("Editing")
		click_link "Delete"
		expect(page).to have_content("Are you sure you want to delete this contact?")
		visit contacts_path
		expect(page).to have_content("#results-entry-#{id}")
	end

end
