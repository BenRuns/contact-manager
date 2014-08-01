
require 'spec_helper'


describe "Deleting a contact do"
	let!(:contact) {create(:contact)}
	 


	it "is successfully deleted" do
		id = contact.id
		contact.first_name = "Steve"

		visit contacts_path
		within("#results-entry-#{id}") do 
			click_link "Edit"
			expect(page).to have_content("Editing")
			click_link "Delete"
		end
		expect(page).to have_content("Are you sure you want to delete this contact?")
		click_link "Yes"
		expect(page).to have_content("Contact has been successfully deleted")
		expect(page).to not_have_content("#results-entry-#{id}")
	end

end
