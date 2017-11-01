require 'rails_helper'

feature 'Edit Account and Business Card' do
  scenario "a user visits the edit account page and edits their account" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    expect(page).to have_content("Rick Deckard")
    expect(page).to have_content("blade@runner.com")

    visit edit_user_path(user)

    fill_in "user[first_name]", with: "Richard"
    fill_in "user[last_name]", with: "Deckard"

    click_on "Submit"

    expect(current_path).to eq('/')
    expect(page).to have_content("Richard Deckard")
    expect(page).to have_content("blade@runner.com")
  end
end
