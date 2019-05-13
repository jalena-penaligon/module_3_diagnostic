require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end
end

feature 'User can search on root page' do
  it 'shows all results by zipcode' do
    visit '/'
    fill_in 'zip', :with => '80206'
    click_button "Locate"

    expect(page).to have_content("Total Results: 90")
  end

  xit 'shows 15 closest stations within 5 miles' do
    visit '/'
    fill_in 'q', :with => '80216'
    click_button "Locate"

    expect(page).to have_content("Total Results: 90")
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80206 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see the total results of the stations that match my query, 90.
# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
