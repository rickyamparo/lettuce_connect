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

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    visit'/connections'

    click_on "Add Connection"

    expect(current_path).to eq('/connections/new')

    fill_in "connection[scanned_id]", with: user_2.id
    click_on "Submit Connection"

    expect(current_path).to eq('/connections')
    expect(page).to have_content("You've added a new connection!")
    expect(page).to have_content(user_2.first_name)
    expect(page).to have_content(user_2.last_name)
    expect(page).to have_content(user_2.handles[0].name)
    expect(page).to have_content(user_2.handles[1].name)
    expect(page).to have_content(user_2.handles[2].name)
  end

  it "redirects back to new connection route if scanned_id does not exist in the database" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'fakegithub2', handle_type: github)
    Handle.create(user: user_2, name: 'faketwitter2', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    visit'/connections'

    click_on "Add Connection"

    expect(current_path).to eq('/connections/new')

    fill_in "connection[scanned_id]", with: "3"
    click_on "Submit Connection"

    expect(current_path).to eq(new_connection_path)
    expect(page).to have_content("That was not a valid lettuce id")
  end
end
