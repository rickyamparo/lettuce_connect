require 'rails_helper'

feature 'Account logout' do
  scenario "A user can logout of their account" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).to have_link("Logout")
    expect(page).to_not have_link("Login")

    click_on "Logout"

    expect(current_path).to eq('/')
    expect(page).to_not have_link("Logout")
    expect(page).to have_link("Login")
  end
end
