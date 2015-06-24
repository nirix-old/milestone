require 'rails_helper'

RSpec.describe VersionsHelper, type: :helper do
  describe "version_status" do
    it "should return 'Active'" do
      expect(helper.version_status(1)).to eq("Active")
    end

    it "should return 'Completed'" do
      expect(helper.version_status(0)).to eq("Completed")
    end

    it "should return 'Cancelled'" do
      expect(helper.version_status(-1)).to eq("Cancelled")
    end
  end

  describe "version_status_options" do
    it "should return array" do
      expect(helper.version_status_options).to be_a(Array)
    end
  end
end
