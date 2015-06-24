require 'rails_helper'

RSpec.describe FormattingHelper, type: :helper do
  describe "markdown" do
    it "should return bold text" do
      expect(helper.markdown("**hello**")).to eq("<p><strong>hello</strong></p>\n")
    end

    it "should return italic text" do
      expect(helper.markdown("_hello_")).to eq("<p><em>hello</em></p>\n")
    end
  end
end
