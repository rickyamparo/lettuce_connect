require 'rails_helper'

describe Tweet do
  it "can return valid attributes" do

    t = Tweet.new(nil)

    expect(t.text).to eq("Not Found")
    expect(t.date).to eq("2017-11-08")
    expect(t.likes).to eq("Not Found")
  end
end
