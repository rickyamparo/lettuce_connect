require 'rails_helper'

feature 'Account handle addition' do
  scenario "A user can add different handles to their account" do
    user = create(:user)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    expect(current_path).to eq('/')
    expect(page).to have_link("Add Handle"

    click_on "Add Handle")

    expect(current_path).to eq('/users/1/handles/new')

    fill_in "handle[name]", with: "rickdeckard"
    select "twitter", from: " user_handle_id"

    click_on "Submit"

    expect(current_path).to eq('/')
    expect(page).to have_content("A handle has been added")

    visit user_handles_path(user)

    expect(page).to have_content("rickdeckard")
  end
end
