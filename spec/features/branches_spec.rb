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

    fill_in "Name", with: "Amsterdam1"
    click_button "Submit"
    expect(page).to have_content("Amsterdam1")
  end

  scenario "Editing a branch" do
    login_as(user, :scope => :user)
    visit "/"
    click_link "Branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")

    fill_in "Name", with: "Amsterdam2"
    click_button "Submit"
    expect(page).to have_content("Amsterdam2")

    within find('tr', text: 'Amsterdam2') do
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

    fill_in "Name", with: "Amsterdam3"
    click_button "Submit"
    expect(page).to have_content("Amsterdam3")

    within find('tr', text: 'Amsterdam3') do
      click_link 'Delete'
    end
    expect(page).to_not have_content("Amsterdam3")
  end

end
