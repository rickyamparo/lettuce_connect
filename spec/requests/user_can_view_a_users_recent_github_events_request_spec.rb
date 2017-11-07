require 'rails_helper'

xfeature 'View a Users github events' do
  it "A user goes to a connection and views github info" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'rickyamparo', handle_type: github)
    Handle.create(user: user_2, name: 'faketwitter2', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    Connection.create(user: user, scanned_id: user_2.id)

    visit '/'
    click_on ("Login")
    fill_in "session[email]", with: "blade@runner.com"
    fill_in "session[password]", with: "replicants"
    click_on ("Submit")

    visit'/connections'
    click_on("Richard")

    within ('.github-handle') do
      expect(page).to have_css('.github-event', count: 3)
    end
  end
end
