require 'rails_helper'

RSpec.describe Version, type: :model do
  describe '#to_param' do
    it "should be the same as slug" do
      version = create(:version)
      expect(version.to_param).to eq(version.slug)
    end
  end
end
