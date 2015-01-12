require "rails_helper"

feature "user creates Vent", %{
  As a user
  I want to be able to create a vent to show
  So that I can share it with others
  } do

    scenario "anyone can post a vent" do
      vent = FactoryGirl.create(:vent)
      visit vents_path
      click_on "Add Vent"
      select(vent.category.name)
      fill_in "Title", with: vent.title
      fill_in "Content", with: vent.content

      click_on "Create Vent"

      expect(page).to have_content vent.title
      expect(page).to have_content vent.content

    end
    scenario "site is not created successfully" do
      visit vents_path
      click_on "Add Vent"

      click_on "Create Vent"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Content can't be blank"
      expect(page).to have_content "Category can't be blank"

    end
  end
