require 'rails_helper'

describe "Connections API" do
  scenario "a user requests a count of all connections made" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard1", email: "blade@runner2.com")
    user_3 = create(:user, first_name: "Richard2", email: "blade@runner3.com")
    user_4 = create(:user, first_name: "Richard3", email: "blade@runner4.com")

    github = HandleType.create(name: "Github")
    twitter = HandleType.create(name: "Twitter")
    linkedin = HandleType.create(name: "LinkedIn")

    Handle.create(user: user_2, name: 'rickyamparo', handle_type: github)
    Handle.create(user: user_2, name: 'rickyaceamparo', handle_type: twitter)
    Handle.create(user: user_2, name: 'fakelinkedin2', handle_type: linkedin)

    Handle.create(user: user_3, name: 'rickyamparo', handle_type: github)
    Handle.create(user: user_3, name: 'rickyaceamparo', handle_type: twitter)
    Handle.create(user: user_3, name: 'fakelinkedin2', handle_type: linkedin)

    Handle.create(user: user_4, name: 'rickyamparo', handle_type: github)
    Handle.create(user: user_4, name: 'rickyaceamparo', handle_type: twitter)
    Handle.create(user: user_4, name: 'fakelinkedin2', handle_type: linkedin)

    Connection.create(user: user, scanned_id: user_2.id)
    Connection.create(user: user, scanned_id: user_3.id)
    Connection.create(user: user, scanned_id: user_4.id)

    get '/api/v1/connections'

    expect(response).to be_success
    expect(response.status).to eq(200)

    connections = JSON.parse(response.body)

    expect(connections.count).to eq(3)
    expect(connections.first["scanned_id"]).to eq(2)
  end
end
