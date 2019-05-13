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


    expect(page).to have_content("Total Results: 93")
  end

  it 'shows 15 closest stations within 5 miles' do
    visit '/'
    fill_in 'zip', :with => '80206'
    click_button "Locate"

    expect(page).to have_content("Closest Stations")
    expect(page).to have_css(".station", count: 15)
  end

  it 'only shows electric and propane stations' do
    visit '/'
    fill_in 'zip', :with => '80206'
    click_button "Locate"

    expect(page).to have_content("ELEC")

    expect(page).to_not have_content("BD")
    expect(page).to_not have_content("CNG")
    expect(page).to_not have_content("E85")
    expect(page).to_not have_content("HY")
    expect(page).to_not have_content("LNG")
  end
end
