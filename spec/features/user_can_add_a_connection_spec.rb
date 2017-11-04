require 'rails_helper'

feature "Add a Connection" do
  scenario "A user adds a connection" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'fakegithub2', handle_type: github)
    Handle.create(user: user_2, name: 'faketwitter2', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit'/connections'

    click_on "Add Connection"

    expect(current_path).to eq('/connections/new')

    fill_in "connection[scanned_id]", with: user_2.id
    click_on "Submit Connection"

    expect(current_path).to eq('/connections')
    expect(page).to have_content(user_2.first_name)
    expect(page).to have_content(user_2.last_name)
    expect(page).to have_content(user_2.handles[0].name)
    expect(page).to have_content(user_2.handles[1].name)
    expect(page).to have_content(user_2.handles[2].name)
  end
end
