require "rails_helper"

feature "user see a list of words", %{
  As a user
  I want to be see a list of words,
  So that I can see a list of word count
  } do

    scenario "user can click on the Words being used and see list of words" do
      vent = FactoryGirl.create(:vent)
      visit vents_path
      click_on "Add Vent"
      select(vent.category.name)
      fill_in "Title", with: vent.title
      fill_in "Content", with: vent.content

      click_on "Create Vent"

      expect(page).to have_content vent.title
      expect(page).to have_content vent.content

      visit words_path

      expect(page).to have_content("Word")
      expect(page).to have_content("Count")
      expect(page).to have_content("i")
      expect(page).to have_content("3")
    end
  end
