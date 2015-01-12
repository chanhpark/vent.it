require "rails_helper"

feature "User updates a comment that they created", %{
  As a user,
  I want to be able to update a comment.

  Acceptance Criteria:
  [ ] I must own the review I am trying to edit.
  [ ] When a review is updated successfully, I see a success message
  [ ] When I am unsuccessful, I see an error message

  } do
    let :vent do
      FactoryGirl.create(:vent)
      FactoryGirl.create(:vent, title: "UGH")
    end

    scenario "User updates a comment they own" do
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

      click_on "Edit Comment"

      fill_in "Reply with a comment", with: "CHANGE"
      click_on "Update Comment"

      expect(page).to have_content "Updated Successfully"
      expect(page).to have_content "CHANGE"
    end
    scenario "User Should not be able to update a review they dont own" do
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

      expect(page).to_not have_content "Edit Review"
    end
  end
