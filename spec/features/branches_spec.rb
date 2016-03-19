require 'rails_helper'

RSpec.feature "Branches", type: :feature do
  scenario "viewing the index" do
    visit "/branches"
    expect(page).to have_selector("h1", text: "Branches")
  end

  scenario "creating a branch" do
    visit "/branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")

    fill_in "Name", with: "Amsterdam"
    click_button "Submit"
    expect(page).to have_content("Amsterdam")
  end

  scenario "Editing a branch" do
    visit "/branches"
    click_link "Edit"
    expect(page).to have_selector("h1", text: "Edit branch")

    fill_in "Name", with: "Barcelona"
    click_button "Submit"
    expect(page).to have_content("Barcelona")
    expect(page).to have_selector("td", text: "Barcelona")
  end

  scenario "Deleting a branch" do
    visit "/branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")

    fill_in "Name", with: "Amsterdam"
    click_button "Submit"
    expect(page).to have_content("Amsterdam")

    within find('tr', text: 'Amsterdam') do
      click_link 'Delete'
    end
    expect(page).to_not have_content("Amsterdam")
  end

end
