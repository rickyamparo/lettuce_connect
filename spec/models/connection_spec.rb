require 'rails_helper'

RSpec.describe Connection, type: :model do
  it{should belong_to(:user)}
  it{is_expected.to validate_presence_of(:scanned_id) }
end
