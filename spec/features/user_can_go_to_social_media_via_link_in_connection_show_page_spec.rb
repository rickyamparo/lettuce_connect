require 'rails_helper'

feature "Handle name link" do
  xit "a user can click on the handle name in the conenctions show" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'rickyamparo', handle_type: github)
    Handle.create(user: user_2, name: 'rickyaceamparo', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    Connection.create(user: user, scanned_id: user_2.id)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    visit'/connections'
    click_on 'Richard'

    expect(page).to have_link("rickyamparo")
    expect(page).to have_link("rickyaceamparo")

    href = "http://www.github.com/rickyamparo"
    expect(find_link('rickyamparo')[:href]).to eq(href)
  end
end
