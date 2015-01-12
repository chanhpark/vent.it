require "rails_helper"

feature "User deletes a comment", %{
  As a user,
  I want to delete a comment I created,
  So that I can remove outdated information.

  Acceptance Criteria:
  [ ] I can delete my comment when i am signed in
  [ ] I should not see a delete button if I am signed out
  [ ] I should not see a delete button if I did not create the review

  } do
    let :vent do
      FactoryGirl.create(:vent)
      FactoryGirl.create(:vent, title: "MMHMM")
    end
    scenario "User delete a comment they created" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Sign Out")

      visit vent_path(vent)
      fill_in "Reply with a comment", with: "awesome!"
      click_on "Create Comment"

      expect(page).to have_content "Comment has been posted"
      expect(page).to have_content "Delete"

      click_on "Delete"

      expect(page).to have_content "Deleted Successfully"
    end
    scenario "User should not see delete button if signed out" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      visit vent_path(vent)
      fill_in "Reply with a comment", with: "awesome!"
      click_on "Create Comment"
      click_on "Sign Out"

      visit vent_path(vent)

      expect(page).to_not have_content "Delete"
    end
    scenario "User should not see delete button if they do not own the comment" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      visit vent_path(vent)

      fill_in "Reply with a comment", with: "awesome!"
      click_on "Create Comment"
      click_on "Sign Out"


      visit vent_path(vent)

      expect(page).to_not have_content "Delete"
    end
  end
