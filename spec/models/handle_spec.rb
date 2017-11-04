require 'rails_helper'

RSpec.describe Handle, type: :model do
  it{should belong_to(:user)}
  it{should belong_to(:handle_type)}
  it { is_expected.to validate_presence_of(:name) }
end
