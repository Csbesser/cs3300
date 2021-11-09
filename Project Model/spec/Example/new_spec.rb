require "rails_helper"


#this is a spec messing with strings, and trying to display or show them
RSpec.describe "hello spec" do
  # ...
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end
 