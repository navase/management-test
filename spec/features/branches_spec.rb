require 'rails_helper'

RSpec.feature "Branches", type: :feature do
  user = FactoryGirl.create(:user)

  scenario "viewing the index" do
    login_as(user, :scope => :user)
    visit "/"
    click_link "Branches"
    expect(page).to have_selector("h1", text: "Branches")
  end

  scenario "creating a branch" do
    login_as(user, :scope => :user)
    visit "/"
    click_link "Branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")

    fill_in "Name", with: "Amsterdam"
    click_button "Submit"
    expect(page).to have_content("Amsterdam")
  end

  scenario "Editing a branch" do
    login_as(user, :scope => :user)
    visit "/"
    click_link "Branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")

    fill_in "Name", with: "Amsterdam"
    click_button "Submit"
    expect(page).to have_content("Amsterdam")

    within find('tr', text: 'Amsterdam') do
      click_link 'Edit'
    end

    expect(page).to have_selector("h1", text: "Edit branch")

    fill_in "Name", with: "Barcelona"
    click_button "Submit"
    expect(page).to have_selector("td", text: "Barcelona")
  end

  scenario "Deleting a branch" do
    login_as(user, :scope => :user)
    visit "/"
    click_link "Branches"
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
