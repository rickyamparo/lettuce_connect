require 'rails_helper'

feature 'Account Registration' do
  scenario "A visitor visits the home page and registers an account" do
    visit '/'

    expect(page).to have_link("Register")
    click_on ("Register")

    expect(current_path).to eq('/users/new')

    fill_in "user[first_name]", with: "Rick"
    fill_in "user[last_name]", with: "Deckard"
    fill_in "user[email]", with: "blade@runner.com"
    fill_in "user[password]", with: "replicants"

    click_on "Submit"

    expect(current_path).to eq('/')
  end
end
