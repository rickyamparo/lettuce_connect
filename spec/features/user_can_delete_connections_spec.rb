require 'rails_helper'

feature "Delete a Connection" do
  scenario "A user deletes a connection" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'fakegithub2', handle_type: github)
    Handle.create(user: user_2, name: 'faketwitter2', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    Connection.create(user: user, scanned_id: user_2.id)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    visit'/connections'

    expect(page).to have_content("Richard")
    expect(page).to have_content("fakegithub2")
    expect(page).to have_content("faketwitter2")
    expect(page).to have_content("fakelinkedin2")
    expect(page).to have_link("Delete Connection")

    click_on "Delete Connection"

    expect(current_path).to eq('/connections')

    expect(page).to have_content("You have deleted your connection with Richard")
    expect(page).to_not have_content("fakegithub2")
    expect(page).to_not have_content("faketwitter2")
    expect(page).to_not have_content("fakelinkedin2")
  end
end
