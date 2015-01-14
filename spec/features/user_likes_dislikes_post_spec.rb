require "rails_helper"

feature "votes on vent", %{
  As an authenticated user I want to vote on a vent.
  I can only vote once per comment
  Each comment has a total number of votes.

  Acceptance Criteria:

  [ ] User is authenticated
  [ ] User votes on a vent
  [ ] User can change their vote
  [ ] vent has a total number of votes
  [ ] Users can only vote once per comment


  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    let (:vent) do
      FactoryGirl.create(:vent)
    end

    scenario "User can like a vent on index" do
      vent = FactoryGirl.create(:vent)
      sign_in_as(user)
      save_and_open_page
      expect(page).to have_content vent.title

      click_link("Like")
      expect(page).to have_content vent.get_upvotes.size
    end

    scenario "User can dislike a vent on index" do
      vent = FactoryGirl.create(:vent)
      sign_in_as(user)
      save_and_open_page

      click_link("Dislike")
      expect(page).to have_content vent.get_downvotes.size
    end

    scenario "User can change votes on a vent on index" do
      vent = FactoryGirl.create(:vent)
      sign_in_as(user)
      save_and_open_page

      click_link("Dislike")
      expect(page).to have_content vent.get_downvotes.size

      click_link("Like")
      expect(page).to have_content vent.get_upvotes.size
    end

    scenario "User can like a vent on show page" do
      sign_in_as(user)

      visit vent_path(vent)
      click_link("Like")

      expect(page).to have_content vent.get_upvotes.size
    end

    scenario "User can dislike a vent on show page" do
      sign_in_as(user)

      visit vent_path(vent)
      click_link("Dislike")

      expect(page).to have_content vent.get_downvotes.size
    end

    scenario "User can change vote on show page" do
      sign_in_as(user)

      visit vent_path(vent)
      click_link("Like")
      click_link("Dislike")

      expect(page).to have_content vent.get_downvotes.size
      expect(page).to have_content "You Disliked this vent"
    end

    scenario "User can only vote once per comment on show page" do
      sign_in_as(user)

      visit vent_path(vent)
      click_link("Like")
      click_link("Dislike")
      click_link("Dislike")

      expect(page).to have_content vent.get_downvotes.size
      expect(page).to have_content "You Disliked this vent"
    end
  end
