require "rails_helper"

feature "Admin deletes and edits comments", %{
  As admin I want to edit or delete a comment

  Acceptance Criteria:
  When I delete the comment, it no longer appears in the vents's view
  an error message
  When I edit the vents details, the updated details
  are shown on the vents's page
  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    let(:admin_user) do
      FactoryGirl.create(:user, admin: true)
    end

    let(:new_vent) do
      FactoryGirl.create(:vent)
      FactoryGirl.create(:vent, title: "UGH")
      FactoryGirl.create(:vent, title: "yeah")

    end

    scenario "admin visits vent's details" do
      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log in"

      visit vent_path(new_vent)

      fill_in "Reply with a comment", with: "bad word"
      click_on "Create Comment"

      expect(page).to have_content "Comment has been posted"

      click_on "Sign Out"

      visit new_user_session_path

      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password

      click_button "Log in"
      visit vent_path(new_vent)

      expect(page).to have_content "Edit Comment"
      expect(page).to have_content "Delete"
    end

    scenario "admin deletes vent" do
      FactoryGirl.create(:vent)
      visit new_user_session_path

      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log in"

      visit admin_vents_path
      expect(page).to have_content "Insecurities"

      click_on "Delete"

      expect(page).to_not have_content "Insecurities"
    end

    scenario "admin edits vent" do
      FactoryGirl.create(:vent)

      visit new_user_session_path

      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log in"

      visit admin_vents_path
      expect(page).to have_content "Insecurities"

      click_on "Edit"

      fill_in "Title", with: "Family"
      click_on "Update Vent"

      expect(page).to_not have_content "Insecurities"
    end
  end
