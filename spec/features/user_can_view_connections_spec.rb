require 'rails_helper'

feature 'Account connections' do
  scenario "A user can view all of their connections" do
    visit '/connections'

    expect(page).to have_css('.table')

    within first('.table') do
      expect(page).to have_css('.connection')
      within first('.connection') do
        expect(page).to have_content("Github")
        expect(page).to have_content("Twitter")
        expect(page).to have_content("LinkedIn")
      end
      expect(page).to have_content("fakegithub")
      expect(page).to have_content("faketwitter")
      expect(page).to have_content("fakelinkedin")
    end
  end
end
