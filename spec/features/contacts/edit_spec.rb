
require 'spec_helper'


describe "Editing a contact to the do list" do 
	let!(:contact) {create(:contact)}


	it "is successfully changes name content" do
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{contact.id}") do 
			click_link "Edit"

		end
		expect(page).to have_content("Editing")
		within(".edit_contact") do 
			fill_in "contact_first_name", with: "Ben"
			fill_in "contact_phone_number", with: "833-88755-888"
			click_button "Update Contact"
		end
		
		expect(page).to have_content("Contact has been successfully added")
		
		within("#results-entry-#{contact.id}") do 
			expect(page).to have_content("Ben")
			expect(page).to have_content("833-88755-888")
		end
	end

end