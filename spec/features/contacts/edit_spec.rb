
require 'spec_helper'


feature "User edits a contact " do 



	scenario  "successfully " do
		contact = create(:contact)
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{contact.id}") do 
			click_link "Edit"
		end

		expect(page).to have_content("Editing")
		within(".edit_contact") do 
			fill_in "First Name", with: "Ben"
			fill_in "Phone Number", with: "833-88755-888"
			click_button "Update Contact"
		end

		expect(page).to have_content("Contact has been successfully updated")
		
		within("#results-entry-#{contact.id}") do 
			expect(page).to have_content("Ben")
			expect(page).to have_content("833-88755-888")
		end
	end

	scenario  "unsuccessfully " do
		contact = create(:contact)
		contact.first_name = "Steve"
		contact.save

		visit contacts_path
		within("#results-entry-#{contact.id}") do 
			expect(page).to have_content("Steve")
			click_link "Edit"
		end
		
		expect(page).to have_content("Editing")
		within(".edit_contact") do 
			fill_in "First Name", with: ""
			fill_in "Phone Number", with: "833-88755-888"
			click_button "Update Contact"
		end

		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a First Name")
		visit contacts_path
		
		within("#results-entry-#{contact.id}") do 
			expect(page).to have_content("Steve")
		end
	end


end