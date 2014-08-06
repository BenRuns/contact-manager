
require 'spec_helper'


feature "User deletes a contact" do




	scenario  "user successfully deletes contact " do
		


		Capybara.current_driver = :selenium
       @contact = Contact.new( :first_name => "Fake",
   :last_name => "FakeLname", :email => "khgk@hgkg.ney", :id => "5")
       @contact.save

		visit contact_path(@contact)

		expect(page).to have_content("Editing")
		click_button "Delete"
		
		expect(page).to have_content("Contact has been successfully deleted")
		expect(page).to_not have_content("#results-entry-#{id}")
	end


end
