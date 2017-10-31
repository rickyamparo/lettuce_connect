require 'rails_helper'

describe 'Account Registration' do
  scenario "A visitor visits the home page and registers an account" do
    visit '/'

    expect(page).to have_link("Register Account")
    click_on ("Register Account")

    expect(current_path).to eq('/register')

    fill_in "user[first_name]", with: "Rick"
    fill_in "user[last_name]", with: "Deckard"
    fill_in "user[email]", with: "blade@runner.com"
    fill_in "user[password]", with: "replicants"
    fill_in "user[password_confirmation]", with: "replicants"

    click_on "Submit"

    expect(current_path).to eq('/')
    expect(page).to have_link("Edit Profile")
    expect(page).to have_link("Manage Connection")
    expect(page).to have_link("Logout")
    expect(page).to_not have_link("Login")
  end
end
