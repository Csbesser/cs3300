
require "rails_helper"

#this will test the users ability to be able to access the hone page
RSpec.feature "Visiting the homepage", type: :feature do
  
  #should the test be succeessful, the user should be at the projects page
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end

