require 'rails_helper'

feature 'Account connections' do
  scenario "A user can view all of their connections" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user, name: 'fakegithub', handle_type: github)
    Handle.create(user: user, name: 'faketwitter', handle_type: twitter)
    Handle.create(user: user, name: 'fakelinkedin', handle_type: linkedin)

    Handle.create(user: user_2, name: 'fakegithub2', handle_type: github)
    Handle.create(user: user_2, name: 'faketwitter2', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    Connection.create(user: user, scanned_id: user_2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/connections'

    expect(page).to have_css('.table')

    within ('.table') do
      expect(page).to have_css('.connection')
      within first('.connection') do
        expect(page).to have_content("fakegithub2")
        expect(page).to have_content("faketwitter2")
        expect(page).to have_content("fakelinkedin2")
      end
    end
  end
end
