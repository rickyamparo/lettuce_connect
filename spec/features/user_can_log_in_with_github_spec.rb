require 'rails_helper'

feature "User can view basic github information" do

  before(:each) do
    stub_omniauth
  end

  scenario "a user logs in and can view their basic github information" do
    visit "/"
    click_on "Sign in with Github"
    expect(current_path).to eq("/")
    expect(page).to_not have_content("Sign in with Github")
    expect(page).to have_content('Ricky Amparo')
    expect(page).to have_content('rickyamparo@gmail.com')
  end

end
