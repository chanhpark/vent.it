require "rails_helper"

feature "user adds reply", %{
  As a user, I want to be able to reply to vents
  So others can see and give feedback.

  Acceptance Criteria:
  -[ ] I must see those on the vents page
  -[ ] I must be signed in to Create comment
  } do

    let (:test_vent) do
      FactoryGirl.create(:vent)
      FactoryGirl.create(:vent, title: "MERP!")
    end

    scenario "Visits a vent" do

      visit vent_path(test_vent)

      expect(page).to have_content "Reply with a comment"
    end

    scenario "Create Comment" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Sign Out")

      visit vent_path(test_vent)
      fill_in "Reply with a comment", with: "awesome!"
      click_on "Create Comment"

      expect(page).to have_content "Comment has been posted"
    end
    scenario "user tries to add multiple comments to a vent" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      visit vent_path(test_vent)

      fill_in "Reply with a comment", with: "awesome YES!"
      click_on "Create Comment"
      fill_in "Reply with a comment", with: "awesome!"
      click_on "Create Comment"

      expect(page).to have_content "You already commented on this vent"

    end

    scenario "User tries to add comment as a Guest" do

      visit vent_path(test_vent)
      click_on "Create Comment"

      expect(page).to have_content "You need to sign in
      or sign up before continuing."
    end

    scenario "user tries comment blank to vent" do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      visit vent_path(test_vent)

      fill_in "Reply with a comment", with: ""
      click_on "Create Comment"

      expect(page).to have_content "You cant leave a blank reply"
    end
  end
