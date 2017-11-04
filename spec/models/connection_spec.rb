require 'rails_helper'

RSpec.describe Connection, type: :model do
  it{should belong_to(:user)}
  it{is_expected.to validate_presence_of(:scanned_id) }
end

describe 'instance methods' do
  it "can return scanned_user" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    conn = Connection.create(user: user, scanned_id: user_2.id)

    expect(conn.scanned_user).to eq(user_2)
  end

  it "can return github handle" do
    user = create(:user)
    user_2 = create(:user, first_name: "Richard", email: "blade@runner2.com")

    handle_type = HandleType.create(name: "github")
    user_2_handle = Handle.create(name: "richarddeckard", user: user_2, handle_type: handle_type)

    conn = Connection.create(user: user, scanned_id: user_2.id)

    expect(conn.github_handle.name).to eq(user_2_handle.name)
  end
end
