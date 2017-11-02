require 'rails_helper'

feature 'Account connections' do
  scenario "A user can view all of their connections" do
    user = create(:user)
    user_2 = create(:user, name: "Richard")

    Handle.create(user: user, name: 'fakegithub')
    Handle.create(user: user, name: 'faketwitter')
    Handle.create(user: user, name: 'fakelinkedin')

    Handle.create(user: user_2, name: 'fakegithub2')
    Handle.create(user: user_2, name: 'faketwitter2')
    Handle.create(user: user_2, name: 'fakelinkedin2')

    Connection.create(user_1: user, user_2: user_2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/connections'

    expect(page).to have_css('.table')

    within ('.table') do
      expect(page).to have_css('.connection')
      within first('.connection') do
        expect(page).to have_content("Github")
        expect(page).to have_content("Twitter")
        expect(page).to have_content("LinkedIn")
      end

      expect(page).to have_content("fakegithub2")
      expect(page).to have_content("faketwitter2")
      expect(page).to have_content("fakelinkedin2")
    end
  end
end
