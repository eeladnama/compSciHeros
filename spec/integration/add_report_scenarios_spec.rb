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
    
    scenario "User successfully creates a new report" do
        visit new_report_path
        expect(page).to have_content("New Report")
        fill_in "Title", with: "New Capybara Report"
        fill_in "Location", with: "Location"
        fill_in "Desc", with: "This is a new Capybara report"
        fill_in "Email", with: "user@test.com"
        click_button "Create Report"
        expect(page).to have_content("New Capybara Report")
        expect(page).to have_content("Location")
        expect(page).to have_content("This is a new Capybara report")
        expect(page).to have_content("user@test.com")
    end
end
