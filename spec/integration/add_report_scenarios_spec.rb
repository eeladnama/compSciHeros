require 'rails_helper.rb'

feature"User adds a report" do
    scenario "User successfully navigates to the new report page from the listing reports page" do
        visit reports_path
        expect(page).to have_content("Listing Report")
        click_button "New Report"
        visit new_report_path
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
    end
end

feature "User adds a testimony" do
    scenario "User successfully navigates to the new testimony page from the listing testimony page" do
        visit testimonials_path
        expect(page).to have_content("Testimonials")
        click_button ('Make A Testimonial')
        visit new_testimonial_path
        expect(page).to have_content("New Testimonials")
        expect(page).to have_field("Title")
        expect(page).to have_field("Name")
        expect(page).to have_field("Desc")
        
    end
    scenario "User successfully creates a new testimonial" do
        visit new_testimonial_path
        expect(page).to have_content("New Testimonials")
        fill_in "Title", with: "New Capybara Testimony"
        fill_in "Name", with: "Name"
        fill_in "Desc", with: "This is a new Capybara testimony"
        click_button "Create Testimonial"
        expect(page).to have_content("New Capybara Testimony")
        expect(page).to have_content("Name")
        expect(page).to have_content("This is a new Capybara testimony")
    end
end
        