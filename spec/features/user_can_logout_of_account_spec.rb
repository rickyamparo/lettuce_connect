require 'rails_helper'

feature 'Account logout' do
  scenario "A user can logout of their account" do
    user = create(:user)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    expect(current_path).to eq('/')
    expect(page).to have_link("Logout")
    expect(page).to_not have_link("Login")

    click_on "Logout"

    expect(current_path).to eq('/')
    expect(page).to_not have_link("Logout")
    expect(page).to have_link("Login")
  end
end
