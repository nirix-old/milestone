require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not be an admin" do
    user = create(:user)
    expect(user.is_admin?).to eq(false)
  end

  it "should be an admin" do
    admin = create(:admin)
    expect(admin.is_admin?).to eq(true)
  end
end
