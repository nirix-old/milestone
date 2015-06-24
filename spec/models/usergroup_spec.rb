require 'rails_helper'

RSpec.describe Usergroup, type: :model do
  it "should not be an admin" do
    group = create(:usergroup)
    expect(group.is_admin?).to eq(false)
  end

  it "should be an admin" do
    admingroup = create(:admingroup)
    expect(admingroup.is_admin?).to eq(true)
  end
end
