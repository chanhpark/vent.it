require "rails_helper"

feature "search vents" do
  scenario "fill in search form and view results" do
    vent1 = FactoryGirl.create(:vent, title: "I HATE IT!")
    vent2 = FactoryGirl.create(:vent, title: "HATERS GOING TO HATE")
    FactoryGirl.create(:vent, title: "rip-off")

    visit vents_path
    fill_in "query", with: "hate"
    click_button "Search"

    expect(page).to have_link("I HATE IT!", href: vent_path(vent1))
    expect(page).to have_link("HATERS GOING TO HATE", href: vent_path(vent2))
    expect(page).to_not have_content("rip-off")
  end

  scenario "fill in blank search" do
    visit vents_path
    fill_in "query", with: "damn"
    click_button "Search"

    expect(page).to have_content("No results found")
  end

end
