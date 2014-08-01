require 'spec_helper'


describe "Viewing the Index Page" do 
	27.times {|x| let!(x.to_s) {create(:contact)} }


	it "only shows 25 contacts " do
		visit contacts_path 
		 within ".results" do
		 	expect(page).to have_css(".results-entry", :count=>25)
		end
	end

	it "shows name location, phone number and email in the headers" do 
		visit contacts_path
		within ".results-headers" do
			expect(page).to have_content("Name")
			expect(page).to have_content("Location")
			expect(page).to have_content("Phone")
			expect(page).to have_content("Email")

		end






	end
end

