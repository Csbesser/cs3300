require "rails_helper"


#this spec is to show how the script would show how things are correct or not
RSpec.describe "The math below is wrong..." do
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(43)
  end
end