require 'rails_helper'

describe 'View a Users recent tweet' do
  xscenario "A user goes to a connection and views recent tweet by that user" do
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
    click_on("Richard")

    within ('.twitter-handle') do
      expect(page).to have_css('.twitter-tweet')
    end
  end
end
