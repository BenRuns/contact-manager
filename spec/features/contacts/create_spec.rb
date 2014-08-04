require 'spec_helper'


feature "User trys to add a contact " do 
	
	before do 
		visit contacts_path
		click_button "Add New Contact"
	end


	scenario "user adds valid content " do

		expect(page).to have_content("New Contact")
		within("#new_contact") do 
			fill_in "First Name", with: "Ben"
			fill_in "Last Name", with: "There"
			fill_in "Email", with: "Fake@email.com"
			click_button "Create Contact"
		end
		expect(page).to have_content("Contact has been successfully added")
	end

	scenario "doesn't enter content before hitting Create Contact" do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a First Name")
		expect(page).to have_content("Please enter a Last Name")
		expect(page).to have_content("Please enter an Email")

	end

	scenario "only enters a first name and last name" do

		visit contacts_path
		click_button "Add New Contact"
		expect(page).to have_content("New Contact")
		within("#new_contact") do 
			fill_in "First Name", with: "Ben"
			fill_in "Last Name", with: "There"
			click_button "Create Contact"
		end
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter an Email")

	end

	scenario "only enters a first name" do

		expect(page).to have_content("New Contact")
		within("#new_contact") do 
			fill_in "First Name", with: "Ben"
			click_button "Create Contact"
		end
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a Last Name")
		expect(page).to have_content("Please enter an Email")

	end
	scenario "only enters a first name" do

		expect(page).to have_content("New Contact")
		within("#new_contact") do 
			fill_in "First Name", with: "Ben"
			click_button "Create Contact"
		end
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a Last Name")
		expect(page).to have_content("Please enter an Email")

	end


	scenario "enters a bad email" do

		expect(page).to have_content("New Contact")
		within("#new_contact") do 
			fill_in "First Name", with: "Ben"
			fill_in "Last Name", with: "There"
			fill_in "Email", with: "not$real"
			click_button "Create Contact"
		end 

		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter a valid email")

	end

	scenario "is unsuccessful with strange characters in the phone number " do

		expect(page).to have_content("New Contact")
		fill_in "First Name", with: "Ben"
		fill_in "Phone Number", with: "555$999"
		click_button "Create Contact"
		expect(page).to have_content("There was a problem adding the contact")
		expect(page).to have_content("Please enter the phone number without non-standard characters ")

	end

end
