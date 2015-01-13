require "rails_helper"

feature "user see a list of categories", %{
  As a user
  I want to be see a list of categories,
  So that I can see a list of vents with just
  that specific category.
  } do

    scenario "sees the list of categories" do
      vent = FactoryGirl.create(:vent)
      visit root_path

      expect(page).to have_content vent.category.name
    end

    scenario "user can click on the category and see list of vents" do
      vent = FactoryGirl.create(:vent)

      visit root_path

      click_on vent.category.name

      expect(page).to have_content "Insecurities"
      expect(page).to_not have_content "Reply with a comment"
    end
    let(:user) do
      FactoryGirl.create(:user)
    end

    scenario "user can click on the vent to reply with a comment" do
      vent = FactoryGirl.create(:vent)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Sign Out")

      click_on vent.category.name

      expect(page).to have_content "Insecurities"
      expect(page).to_not have_content "Reply with a comment"

      click_on "Insecurities"

      expect(page).to have_content "Reply with a comment"

      fill_in "Reply with a comment", with: "its okay"
      click_on "Create Comment"

      expect(page).to have_content "Comment has been posted"
    end
  end
