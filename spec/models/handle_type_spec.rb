require 'rails_helper'

RSpec.describe HandleType, type: :model do
  it{should have_many(:handles)}
  it{is_expected.to validate_presence_of(:name) }
end
