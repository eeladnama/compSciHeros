require 'rails_helper.rb'

feature"User adds a report" do
    scenario "User successfully navigates to the new report page from the listing reports page" do
        visit reports_path
        expect(page).to have_content("Listing Reports")
        click_link "New Report"
        expect(page).to have_content("New Report")
        expect(page).to have_field("Title")
        expect(page).to have_field("Location")
        expect(page).to have_field("Desc")
        expect(page).to have_field("Email")
    end
end