require 'rails_helper.rb'

feature"User adds a report" do
    scenario "User successfully navigates to the new report page from the listing reports page" do
        visit reports_path
        expect(page).to have_content("Listing Report")
        click_button ('New Report')
        expect(page).to have_content("New Report")
        expect(page).to have_content("Title")
        expect(page).to have_content("Location")
        expect(page).to have_content("Desc")
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
    end
end
