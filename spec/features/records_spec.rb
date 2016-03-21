require 'rails_helper'

RSpec.feature "Records", type: :feature do
  user = FactoryGirl.create(:user)

  before do
    login_as(user, :scope => :user)
    visit root_path
  end

  scenario "viewing the index" do
    expect(page).to have_selector("h1", text: "Records")
  end

  scenario "creating a record" do
    # Create a branch
    click_link "Branches"
    click_link "New branch"
    expect(page).to have_selector("h1", text: "New branch")
    fill_in "Name", with: "Amsterdam4"
    click_button "Submit"
    expect(page).to have_content("Amsterdam4")

    # Create a record
    click_link "Records"
    select "Amsterdam4", :from => "record_branch_id"
    fill_in "record_start_date", with: "2015-01-01"
    fill_in "record_end_date", with: "2015-12-31"
    fill_in "consumption_data-field", with: "12345"
    click_button "Submit"
    expect(page).to have_content("12345")
  end

  scenario "Editing a record" do
    # Create a record
    fill_in "record_start_date", with: "2015-01-01"
    fill_in "record_end_date", with: "2015-12-31"
    fill_in "consumption_data-field", with: "12345"
    click_button "Submit"
    expect(page).to have_content("12345")

    # Find the record and go to edit page
    within find('tr', text: '12345') do
      click_link 'Edit'
    end
    expect(page).to have_selector("h1", text: "Edit record")

    # Edit the record
    fill_in "record_consumption_data", with: "54321"
    click_button "Submit"
    expect(page).to have_selector("td", text: "54321")
  end

  scenario "Deleting a record" do
    # Create a record
    fill_in "record_start_date", with: "2015-01-01"
    fill_in "record_end_date", with: "2015-12-31"
    fill_in "consumption_data-field", with: "12345"
    click_button "Submit"
    expect(page).to have_content("12345")

    # Find and delete the record
    within find('tr', text: '12345') do
      click_link 'Delete'
    end
    expect(page).to_not have_content("12345")
  end

  pending "User cannot verify new record"
  pending "User cannot verify existing record"
end
