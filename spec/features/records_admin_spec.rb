require 'rails_helper'

RSpec.feature "Records", type: :feature do
  admin = FactoryGirl.create(:user, admin: true)

  before do
    login_as(admin, :scope => :user)
    visit root_path
  end

  scenario "Admin can verify new record" do
    fill_in "record_start_date", with: "2015-01-01"
    fill_in "record_end_date", with: "2015-12-31"
    fill_in "consumption_data-field", with: "12345"
    check "record_verified"
    click_button "Submit"
    expect(page).to have_content("12345")

    within find('tr', text: '12345') do
      expect(page).to have_content("✔")
    end
  end

  pending "Admin can verify existing record" do
    fill_in "record_start_date", with: "2015-01-01"
    fill_in "record_end_date", with: "2015-12-31"
    fill_in "consumption_data-field", with: "55555"
    click_button "Submit"
    expect(page).to have_content("55555")

    within find('tr', text: '55555') do
      # Bip_pool searches for best_in_place_record_verified instead of
      # best_in_place_record_#{record.id}_verified
      bip_bool("record", "verified")
    end
  end
end
