require 'rails_helper'

feature 'Account Login' do
  scenario 'A visitor visits the home page and logs into their account' do
    visit '/'

    expect(page).to have_link("Login")
    expect(page).to_not have_link("Logout")

    click_on ("Login")

    expect(current_path).to eq('/login')

    fill_in "user[email]", with: "blade@runner.com"
    fill_in "user[password]", with: "replicants"

    click_on ("Login")

    expect(current_path).to eq('/')
    expect(page).to have_link("Logout")
    expect(page).to_not have_link("Login")
  end
end
