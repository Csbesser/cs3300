
require 'rails_helper'

#this rspec runs through the process of creating a project,
#the same one that the user would run through.

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do

      #takes the user to the create a new project path
      visit new_project_path

      within("form") do
        
        #names the project Test Title
        fill_in "Title", with: "Test title"
      end
    end

    #should be creating a title be successful, the description would be next
    scenario "should be successful" do

      #fill the description box with the sentence "Test Description"
      fill_in "Description", with: "Test description"

      #clicks on the create project button
      click_button "Create Project"

      #lets the user know that the process had worked
      expect(page).to have_content("Project was successfully created")
    end

    #if the description creation process were to fail, the 
    #failed message would be displayed for the user
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end


  #tests the process in order for a user to be able to update their proejct
  context "Update project" do

    #replaces the current title for the projcect and description
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    #if the process is to work out successfully, display a successful notification
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    #process should the test fail
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #this test specifically runs through the process where a user
  #would go through the process in order to delete their project
  context "Remove existing project" do

    #deletes the specfic project Test Title
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end

